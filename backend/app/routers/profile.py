import secrets
import uuid
from pathlib import Path
from typing import Annotated

from fastapi import APIRouter, Depends, File, HTTPException, UploadFile
from sqlalchemy.orm import Session

from app.config import settings
from app.database import get_db
from app.deps import CurrentUser
from app.email_util import send_verification_email
from app.models import NotificationSettings, SubscriptionPlan, User
from app.schemas import (
    ChangePasswordRequest,
    NotificationSettingsOut,
    ProfileOut,
    ProfileUpdate,
    SettingsUpdate,
    UserPublic,
)
from app.security import hash_password, verify_password

router = APIRouter(prefix="/profile", tags=["profile"])
_MAX_AVATAR_BYTES = 5 * 1024 * 1024
_ALLOWED_AVATAR_TYPES = {
    "image/jpeg": ".jpg",
    "image/png": ".png",
    "image/webp": ".webp",
}
_UPLOADS_DIR = Path(__file__).resolve().parents[2] / "uploads" / "avatars"


def _backend_origin() -> str:
    return settings.oauth_redirect_base.rstrip("/")


@router.get("", response_model=ProfileOut)
def get_profile(db: Annotated[Session, Depends(get_db)], user: CurrentUser):
    settings = db.query(NotificationSettings).filter(NotificationSettings.user_id == user.id).first()
    if settings is None:
        raise HTTPException(status_code=500, detail="Settings missing")
    sub = user.subscription
    plan = sub.plan if sub else SubscriptionPlan.free

    return ProfileOut(
        user=UserPublic.model_validate(user),
        settings=NotificationSettingsOut.model_validate(settings),
        subscription_plan=plan,
    )


@router.put("", response_model=UserPublic)
def update_profile(db: Annotated[Session, Depends(get_db)], user: CurrentUser, body: ProfileUpdate):
    if body.name is not None:
        user.name = body.name
    if body.email is not None and body.email.lower() != user.email:
        if db.query(User).filter(User.email == body.email.lower()).first():
            raise HTTPException(status_code=400, detail="Email already in use")
        user.email = body.email.lower()
        if user.password_hash:
            user.is_verified = False
            token = secrets.token_urlsafe(32)
            user.verification_token = token
            try:
                send_verification_email(user.email, token)
            except Exception:
                pass
    db.commit()
    db.refresh(user)
    return UserPublic.model_validate(user)


@router.post("/avatar", response_model=UserPublic)
async def upload_avatar(db: Annotated[Session, Depends(get_db)], user: CurrentUser, file: UploadFile = File(...)):
    if file.content_type not in _ALLOWED_AVATAR_TYPES:
        raise HTTPException(status_code=400, detail="Supported formats: JPEG, PNG, WEBP")

    content = await file.read()
    if not content:
        raise HTTPException(status_code=400, detail="Avatar file is empty")
    if len(content) > _MAX_AVATAR_BYTES:
        raise HTTPException(status_code=400, detail="Avatar file is too large (max 5MB)")

    _UPLOADS_DIR.mkdir(parents=True, exist_ok=True)
    ext = _ALLOWED_AVATAR_TYPES[file.content_type]
    filename = f"{user.id}-{uuid.uuid4().hex}{ext}"
    dest = _UPLOADS_DIR / filename
    dest.write_bytes(content)

    user.avatar_url = f"{_backend_origin()}/uploads/avatars/{filename}"
    db.commit()
    db.refresh(user)
    return UserPublic.model_validate(user)


@router.put("/settings", response_model=NotificationSettingsOut)
def update_settings(db: Annotated[Session, Depends(get_db)], user: CurrentUser, body: SettingsUpdate):
    s = db.query(NotificationSettings).filter(NotificationSettings.user_id == user.id).first()
    if s is None:
        raise HTTPException(status_code=500, detail="Settings missing")
    if body.global_enabled is not None:
        s.global_enabled = body.global_enabled
    if body.quiet_hours_start is not None:
        s.quiet_hours_start = body.quiet_hours_start
    if body.quiet_hours_end is not None:
        s.quiet_hours_end = body.quiet_hours_end
    if body.reminder_tone is not None:
        s.reminder_tone = body.reminder_tone
    if body.user_timezone is not None:
        s.user_timezone = body.user_timezone
    db.commit()
    db.refresh(s)
    return NotificationSettingsOut.model_validate(s)


@router.post("/change-password")
def change_password(db: Annotated[Session, Depends(get_db)], user: CurrentUser, body: ChangePasswordRequest):
    if not user.password_hash:
        raise HTTPException(status_code=400, detail="OAuth account has no password")
    if not verify_password(body.old_password, user.password_hash):
        raise HTTPException(status_code=400, detail="Wrong password")
    user.password_hash = hash_password(body.new_password)
    db.commit()
    return {"message": "Password updated"}
