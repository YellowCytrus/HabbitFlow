"""Email/password registration with 6-digit code (no profile until verified)."""

from __future__ import annotations

from sqlalchemy.orm import Session

from app.models import NotificationSettings, PendingRegistration, User


def test_register_verify_code_creates_profile(client, db_session: Session, monkeypatch):
    captured: list[tuple[str, str]] = []

    def fake_send(to_email: str, code: str) -> None:
        captured.append((to_email, code))

    monkeypatch.setattr("app.routers.auth.send_registration_code_email", fake_send)

    r = client.post(
        "/api/v1/auth/register",
        json={"email": "newuser@example.com", "password": "password123", "name": "New User"},
    )
    assert r.status_code == 200
    assert captured
    email, code = captured[0]
    assert len(code) == 6 and code.isdigit()

    assert db_session.query(User).filter(User.email == "newuser@example.com").first() is None
    assert (
        db_session.query(PendingRegistration).filter(PendingRegistration.email == "newuser@example.com").first()
        is not None
    )

    bad = client.post("/api/v1/auth/login", json={"email": email, "password": "password123"})
    assert bad.status_code == 401

    vr = client.post("/api/v1/auth/verify-registration", json={"email": email, "code": code})
    assert vr.status_code == 200
    tok = vr.json()
    assert "access_token" in tok and "refresh_token" in tok

    db_session.expire_all()
    uid2 = db_session.query(User).filter(User.email == "newuser@example.com").one()
    assert uid2.is_verified is True
    assert db_session.query(NotificationSettings).filter(NotificationSettings.user_id == uid2.id).first() is not None

    pr = client.get("/api/v1/profile", headers={"Authorization": f"Bearer {tok['access_token']}"})
    assert pr.status_code == 200
