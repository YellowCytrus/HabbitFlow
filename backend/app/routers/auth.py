import logging
import secrets
import uuid
from datetime import date, datetime, timedelta, timezone
from typing import Annotated
from urllib.parse import urlencode, urlparse

import httpx
from fastapi import APIRouter, BackgroundTasks, Depends, HTTPException, Query, status
from fastapi.responses import RedirectResponse
from jose import jwt
from sqlalchemy.orm import Session

from app.config import settings
from app.database import get_db
from app.deps import CurrentUser
from app.email_util import send_registration_code_email, send_verification_email
from app.models import (
    NotificationSettings,
    PendingRegistration,
    ReminderTone,
    SubscriptionPlan,
    User,
    UserRole,
    UserSubscription,
)
from app.schemas import (
    AccessTokenBody,
    LoginRequest,
    RefreshRequest,
    RegisterRequest,
    ResendRegistrationCodeRequest,
    TokenPair,
    VerifyEmailRequest,
    VerifyRegistrationRequest,
)
from app.security import create_access_token, create_refresh_token, decode_token, hash_password, verify_password

log = logging.getLogger(__name__)
router = APIRouter(prefix="/auth", tags=["auth"])

_REGISTRATION_CODE_TTL = timedelta(minutes=15)


def _new_registration_code() -> str:
    return f"{secrets.randbelow(1_000_000):06d}"


def _send_registration_code_background(to_email: str, code: str) -> None:
    try:
        send_registration_code_email(to_email, code)
    except Exception:
        log.exception("Failed to send registration code email to %s", to_email)


def _ensure_defaults(db: Session, user: User) -> None:
    if db.query(NotificationSettings).filter(NotificationSettings.user_id == user.id).first() is None:
        db.add(
            NotificationSettings(
                user_id=user.id,
                global_enabled=True,
                reminder_tone=ReminderTone.neutral,
            )
        )
    if db.query(UserSubscription).filter(UserSubscription.user_id == user.id).first() is None:
        db.add(
            UserSubscription(
                user_id=user.id,
                plan=SubscriptionPlan.free,
                start_date=date.today(),
                auto_renew=False,
            )
        )


def _oauth_state_jwt(provider: str) -> str:
    exp = datetime.now(timezone.utc) + timedelta(minutes=10)
    return jwt.encode(
        {"typ": "oauth_state", "p": provider, "exp": exp},
        settings.jwt_secret,
        algorithm=settings.jwt_algorithm,
    )


def _parse_oauth_state(token: str, expected_provider: str) -> None:
    try:
        payload = jwt.decode(token, settings.jwt_secret, algorithms=[settings.jwt_algorithm])
        if payload.get("typ") != "oauth_state" or payload.get("p") != expected_provider:
            raise HTTPException(status_code=400, detail="Invalid OAuth state")
    except Exception as e:
        raise HTTPException(status_code=400, detail="Invalid OAuth state") from e


@router.post("/register")
def register(
    body: RegisterRequest,
    background_tasks: BackgroundTasks,
    db: Annotated[Session, Depends(get_db)],
):
    email = body.email.lower()
    if db.query(User).filter(User.email == email).first():
        raise HTTPException(status_code=400, detail="Email already registered")

    code = _new_registration_code()
    expires = datetime.now(timezone.utc) + _REGISTRATION_CODE_TTL
    pending = db.query(PendingRegistration).filter(PendingRegistration.email == email).first()
    if pending:
        pending.name = body.name
        pending.password_hash = hash_password(body.password)
        pending.verification_code_hash = hash_password(code)
        pending.verification_code_expires_at = expires
    else:
        db.add(
            PendingRegistration(
                email=email,
                password_hash=hash_password(body.password),
                name=body.name,
                verification_code_hash=hash_password(code),
                verification_code_expires_at=expires,
            )
        )
    db.commit()
    background_tasks.add_task(_send_registration_code_background, email, code)
    return {"message": "Check email for verification code", "email": email}


@router.post("/login", response_model=TokenPair)
def login(body: LoginRequest, db: Annotated[Session, Depends(get_db)]):
    user = db.query(User).filter(User.email == body.email.lower()).first()
    if not user or not verify_password(body.password, user.password_hash):
        raise HTTPException(status_code=401, detail="Invalid email or password")
    if not user.is_active:
        raise HTTPException(status_code=403, detail="Account disabled")
    if user.password_hash and not user.is_verified:
        raise HTTPException(status_code=403, detail="Email not verified")
    return TokenPair(
        access_token=create_access_token(user.id),
        refresh_token=create_refresh_token(user.id),
    )


@router.post("/verify-registration", response_model=TokenPair)
def verify_registration(body: VerifyRegistrationRequest, db: Annotated[Session, Depends(get_db)]):
    email = body.email.lower()
    pending = db.query(PendingRegistration).filter(PendingRegistration.email == email).first()
    if not pending:
        raise HTTPException(status_code=400, detail="Invalid code or email")
    if datetime.now(timezone.utc) > pending.verification_code_expires_at:
        raise HTTPException(status_code=400, detail="Code expired")
    if not verify_password(body.code, pending.verification_code_hash):
        raise HTTPException(status_code=400, detail="Invalid code or email")
    if db.query(User).filter(User.email == email).first():
        db.delete(pending)
        db.commit()
        raise HTTPException(status_code=400, detail="Invalid code or email")

    user = User(
        email=email,
        password_hash=pending.password_hash,
        name=pending.name,
        role=UserRole.user,
        is_verified=True,
    )
    db.add(user)
    db.flush()
    db.delete(pending)
    _ensure_defaults(db, user)
    db.commit()
    db.refresh(user)
    return TokenPair(
        access_token=create_access_token(user.id),
        refresh_token=create_refresh_token(user.id),
    )


@router.post("/resend-registration-code")
def resend_registration_code(
    body: ResendRegistrationCodeRequest,
    background_tasks: BackgroundTasks,
    db: Annotated[Session, Depends(get_db)],
):
    email = body.email.lower()
    msg = {"message": "If the account is pending verification, a new code was sent."}
    pending = db.query(PendingRegistration).filter(PendingRegistration.email == email).first()
    if not pending:
        return msg
    code = _new_registration_code()
    pending.verification_code_hash = hash_password(code)
    pending.verification_code_expires_at = datetime.now(timezone.utc) + _REGISTRATION_CODE_TTL
    db.commit()
    background_tasks.add_task(_send_registration_code_background, email, code)
    return msg


@router.post("/verify-email")
def verify_email(body: VerifyEmailRequest, db: Annotated[Session, Depends(get_db)]):
    user = db.query(User).filter(User.verification_token == body.token).first()
    if not user:
        raise HTTPException(status_code=400, detail="Invalid token")
    user.is_verified = True
    user.verification_token = None
    db.commit()
    return {"message": "Email verified"}


@router.post("/refresh", response_model=AccessTokenBody)
def refresh_token(body: RefreshRequest, db: Annotated[Session, Depends(get_db)]):
    uid = decode_token(body.refresh_token, "refresh")
    if uid is None:
        raise HTTPException(status_code=401, detail="Invalid refresh token")
    user = db.query(User).filter(User.id == uid).first()
    if not user or not user.is_active:
        raise HTTPException(status_code=401, detail="Invalid refresh token")
    if user.password_hash and not user.is_verified:
        raise HTTPException(status_code=401, detail="Invalid refresh token")
    return AccessTokenBody(access_token=create_access_token(user.id))


@router.post("/logout")
def logout(_user: CurrentUser):
    return {"message": "ok"}


def _yandex_token(code: str, redirect_uri: str) -> dict:
    with httpx.Client() as client:
        r = client.post(
            "https://oauth.yandex.com/token",
            data={
                "grant_type": "authorization_code",
                "code": code,
                "client_id": settings.yandex_client_id,
                "client_secret": settings.yandex_client_secret,
                "redirect_uri": redirect_uri,
            },
        )
        r.raise_for_status()
        return r.json()


def _yandex_profile(access_token: str) -> dict:
    with httpx.Client() as client:
        r = client.get("https://login.yandex.ru/info", headers={"Authorization": f"OAuth {access_token}"})
        r.raise_for_status()
        return r.json()


def _vk_token(code: str, redirect_uri: str) -> dict:
    with httpx.Client() as client:
        r = client.get(
            "https://oauth.vk.com/access_token",
            params={
                "client_id": settings.vk_client_id,
                "client_secret": settings.vk_client_secret,
                "redirect_uri": redirect_uri,
                "code": code,
            },
        )
        r.raise_for_status()
        return r.json()


def _vk_profile(access_token: str, user_id: str) -> dict:
    with httpx.Client() as client:
        r = client.get(
            "https://api.vk.com/method/users.get",
            params={
                "access_token": access_token,
                "v": "5.131",
                "user_ids": user_id,
                "fields": "photo_200,email",
            },
        )
        r.raise_for_status()
        data = r.json()
        resp = data.get("response") or []
        return resp[0] if resp else {}


@router.get("/oauth/callback")
def oauth_callback(
    db: Annotated[Session, Depends(get_db)],
    code: str | None = Query(None),
    state: str | None = Query(None),
    error: str | None = Query(None),
):
    fe = settings.frontend_origin.rstrip("/")
    if error or not code or not state:
        return RedirectResponse(f"{fe}/auth?oauth_error=1")
    try:
        payload = jwt.decode(state, settings.jwt_secret, algorithms=[settings.jwt_algorithm])
        if payload.get("typ") != "oauth_state":
            return RedirectResponse(f"{fe}/auth?oauth_error=1")
        provider = payload.get("p")
    except Exception:
        return RedirectResponse(f"{fe}/auth?oauth_error=1")

    cb = f"{settings.oauth_redirect_base.rstrip('/')}/api/v1/auth/oauth/callback"
    parsed = urlparse(cb)
    redirect_uri = f"{parsed.scheme}://{parsed.netloc}{parsed.path}"

    try:
        if provider == "yandex":
            tok = _yandex_token(code, redirect_uri)
            at = tok.get("access_token")
            if not at:
                raise ValueError("no access_token")
            info = _yandex_profile(at)
            email = (info.get("default_email") or info.get("login") or "").strip()
            if not email:
                email = f"yandex_{info.get('id', uuid.uuid4())}@oauth.local"
            name = info.get("display_name") or info.get("real_name") or email.split("@")[0]
            avatar = info.get("default_avatar_id") and f"https://avatars.yandex.net/get-yapic/{info['default_avatar_id']}/islands-200"
            oauth_sub = str(info.get("id", ""))
        elif provider == "vk":
            tok = _vk_token(code, redirect_uri)
            at = tok.get("access_token")
            uid = str(tok.get("user_id", ""))
            email = (tok.get("email") or "").strip() or f"vk_{uid}@oauth.local"
            if not at:
                raise ValueError("no access_token")
            prof = _vk_profile(at, uid)
            name = f"{prof.get('first_name', '')} {prof.get('last_name', '')}".strip() or email
            avatar = prof.get("photo_200")
            oauth_sub = uid
        else:
            return RedirectResponse(f"{fe}/auth?oauth_error=1")
    except Exception:
        log.exception("OAuth callback failed")
        return RedirectResponse(f"{fe}/auth?oauth_error=1")

    user = db.query(User).filter(User.email == email.lower()).first()
    if user is None:
        user = User(
            email=email.lower(),
            password_hash=None,
            name=name[:200],
            avatar_url=avatar,
            role=UserRole.user,
            is_verified=True,
            oauth_provider=provider,
            oauth_sub=oauth_sub,
        )
        db.add(user)
        db.commit()
        db.refresh(user)
        _ensure_defaults(db, user)
        db.commit()
    else:
        if avatar and not user.avatar_url:
            user.avatar_url = avatar
        user.oauth_provider = provider
        user.oauth_sub = oauth_sub
        user.is_verified = True
        db.commit()

    access = create_access_token(user.id)
    refresh = create_refresh_token(user.id)
    return RedirectResponse(
        f"{fe}/auth?access_token={access}&refresh_token={refresh}",
        status_code=302,
    )


@router.get("/oauth/{provider}")
def oauth_start(provider: str):
    p = provider.lower()
    if p not in ("yandex", "vk"):
        raise HTTPException(status_code=404, detail="Unknown provider")
    state = _oauth_state_jwt(p)
    cb = f"{settings.oauth_redirect_base.rstrip('/')}/api/v1/auth/oauth/callback"
    if p == "yandex":
        if not settings.yandex_client_id:
            raise HTTPException(status_code=503, detail="Yandex OAuth is not configured")
        q = urlencode(
            {
                "response_type": "code",
                "client_id": settings.yandex_client_id,
                "redirect_uri": cb,
                "state": state,
            }
        )
        return RedirectResponse(f"https://oauth.yandex.ru/authorize?{q}")
    if not settings.vk_client_id:
        raise HTTPException(status_code=503, detail="VK OAuth is not configured")
    q = urlencode(
        {
            "client_id": settings.vk_client_id,
            "display": "page",
            "redirect_uri": cb,
            "scope": "email",
            "response_type": "code",
            "state": state,
            "v": "5.131",
        }
    )
    return RedirectResponse(f"https://oauth.vk.com/authorize?{q}")
