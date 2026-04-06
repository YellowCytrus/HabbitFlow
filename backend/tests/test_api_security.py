"""Security-focused tests: JWT bearer validation and rejection of cookie/session-style credentials."""

from __future__ import annotations

from datetime import datetime, timedelta, timezone
from uuid import uuid4

from jose import jwt

from app.config import settings
from app.security import create_access_token, create_refresh_token

from .conftest import auth_headers, make_user


def _assert_unauthorized(resp) -> None:
    assert resp.status_code == 401
    assert resp.json().get("detail")


def test_protected_route_without_authorization(client, db_session):
    make_user(db_session)
    r = client.get("/api/v1/profile")
    _assert_unauthorized(r)


def test_protected_route_non_bearer_scheme(client, db_session):
    user = make_user(db_session)
    token = create_access_token(user.id)
    r = client.get("/api/v1/profile", headers={"Authorization": f"Digest {token}"})
    _assert_unauthorized(r)


def test_protected_route_basic_instead_of_bearer(client, db_session):
    user = make_user(db_session)
    token = create_access_token(user.id)
    r = client.get("/api/v1/profile", headers={"Authorization": f"Basic {token}"})
    _assert_unauthorized(r)


def test_bearer_malformed_token(client, db_session):
    make_user(db_session)
    r = client.get("/api/v1/profile", headers={"Authorization": "Bearer not-a-jwt"})
    _assert_unauthorized(r)


def test_bearer_wrong_signing_secret(client, db_session):
    user = make_user(db_session)
    payload = {
        "sub": str(user.id),
        "exp": datetime.now(timezone.utc) + timedelta(hours=1),
        "typ": "access",
    }
    bad = jwt.encode(payload, "definitely-not-the-app-secret", algorithm=settings.jwt_algorithm)
    r = client.get("/api/v1/profile", headers={"Authorization": f"Bearer {bad}"})
    _assert_unauthorized(r)


def test_refresh_token_rejected_as_access_token(client, db_session):
    user = make_user(db_session)
    refresh = create_refresh_token(user.id)
    r = client.get("/api/v1/profile", headers={"Authorization": f"Bearer {refresh}"})
    _assert_unauthorized(r)


def test_access_token_expired(client, db_session):
    user = make_user(db_session)
    payload = {
        "sub": str(user.id),
        "exp": datetime.now(timezone.utc) - timedelta(minutes=30),
        "typ": "access",
    }
    expired = jwt.encode(payload, settings.jwt_secret, algorithm=settings.jwt_algorithm)
    r = client.get("/api/v1/profile", headers={"Authorization": f"Bearer {expired}"})
    _assert_unauthorized(r)


def test_valid_jwt_unknown_user_id(client, db_session):
    make_user(db_session)
    ghost_id = uuid4()
    tok = create_access_token(ghost_id)
    r = client.get("/api/v1/profile", headers={"Authorization": f"Bearer {tok}"})
    _assert_unauthorized(r)


def test_valid_jwt_inactive_user(client, db_session):
    user = make_user(db_session, is_active=False)
    tok = create_access_token(user.id)
    r = client.get("/api/v1/profile", headers={"Authorization": f"Bearer {tok}"})
    _assert_unauthorized(r)


def test_jwt_in_cookie_not_accepted_without_authorization_header(client, db_session):
    user = make_user(db_session)
    token = create_access_token(user.id)
    client.cookies.set("access_token", token)
    client.cookies.set("token", token)
    r = client.get("/api/v1/profile")
    _assert_unauthorized(r)


def test_session_style_cookie_not_accepted(client, db_session):
    make_user(db_session)
    client.cookies.set("session", "s3ssion-id")
    client.cookies.set("sessionid", "abc")
    client.cookies.set("connect.sid", "fake")
    r = client.get("/api/v1/profile")
    _assert_unauthorized(r)


def test_bearer_header_only_valid_path(client, db_session):
    user = make_user(db_session)
    client.cookies.set("access_token", "should-be-ignored-if-header-present")
    r = client.get("/api/v1/profile", headers=auth_headers(user.id))
    assert r.status_code == 200


def test_habits_require_bearer_not_query_token(client, db_session):
    user = make_user(db_session)
    token = create_access_token(user.id)
    r = client.get("/api/v1/habits", params={"access_token": token})
    _assert_unauthorized(r)
