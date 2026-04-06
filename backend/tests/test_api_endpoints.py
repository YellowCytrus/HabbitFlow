"""Integration tests for all API routes except /api/v1/auth/*."""

from __future__ import annotations

from datetime import date
from uuid import uuid4

from app.models import SubscriptionPlan

from .conftest import auth_headers, make_user


def _habit_body(**overrides):
    base = {
        "title": "Read",
        "main_goal": "Read daily",
        "micro_step": "Open book",
        "reminder_time": None,
        "adaptive_reminder": False,
        "recurrence_rule": {"type": "daily"},
        "deadline_type": "exact",
        "deadline_value": "00:00-23:59",
    }
    base.update(overrides)
    return base


def test_health_no_auth(client):
    r = client.get("/health")
    assert r.status_code == 200
    assert r.json() == {"status": "ok"}


def test_list_habits_empty(client, db_session):
    user = make_user(db_session)
    r = client.get("/api/v1/habits", headers=auth_headers(user.id))
    assert r.status_code == 200
    assert r.json() == []


def test_habit_crud_and_list_filter(client, db_session):
    user = make_user(db_session)
    h = _habit_body(
        title="Weekly",
        recurrence_rule={"type": "weekly", "days": [1]},
    )
    r = client.post("/api/v1/habits", json=h, headers=auth_headers(user.id))
    assert r.status_code == 201
    hid = r.json()["id"]

    r = client.get("/api/v1/habits", headers=auth_headers(user.id))
    assert len(r.json()) == 1

    monday = date(2026, 4, 6)
    sunday = date(2026, 4, 5)
    r = client.get(
        "/api/v1/habits",
        params={"for_date": monday.isoformat()},
        headers=auth_headers(user.id),
    )
    assert len(r.json()) == 1
    r = client.get(
        "/api/v1/habits",
        params={"for_date": sunday.isoformat()},
        headers=auth_headers(user.id),
    )
    assert r.json() == []

    r = client.get(f"/api/v1/habits/{hid}", headers=auth_headers(user.id))
    assert r.status_code == 200
    body = r.json()
    assert body["title"] == "Weekly"
    assert "streak" in body

    upd = _habit_body(title="Weekly-upd", recurrence_rule={"type": "weekly", "days": [1]})
    r = client.put(f"/api/v1/habits/{hid}", json=upd, headers=auth_headers(user.id))
    assert r.status_code == 200
    assert r.json()["title"] == "Weekly-upd"

    r = client.delete(f"/api/v1/habits/{hid}", headers=auth_headers(user.id))
    assert r.status_code == 200
    assert r.json() == {"success": True}

    r = client.get(f"/api/v1/habits/{hid}", headers=auth_headers(user.id))
    assert r.status_code == 404


def test_habit_logs_list_upsert_missed(client, db_session):
    user = make_user(db_session)
    r = client.post("/api/v1/habits", json=_habit_body(), headers=auth_headers(user.id))
    hid = r.json()["id"]
    log_day = date.today().isoformat()

    r = client.get(f"/api/v1/habits/{hid}/logs", headers=auth_headers(user.id))
    assert r.status_code == 200
    assert r.json() == []

    r = client.post(
        f"/api/v1/habits/{hid}/logs",
        json={"status": "missed", "date": log_day},
        headers=auth_headers(user.id),
    )
    assert r.status_code == 200
    lid = r.json()["id"]

    r = client.post(
        f"/api/v1/habits/{hid}/logs",
        json={"status": "missed", "date": log_day},
        headers=auth_headers(user.id),
    )
    assert r.status_code == 200
    assert r.json()["id"] == lid

    r = client.get(
        f"/api/v1/habits/{hid}/logs",
        params={"from": log_day, "to": log_day},
        headers=auth_headers(user.id),
    )
    assert len(r.json()) == 1


def test_log_not_scheduled_day_returns_400(client, db_session):
    user = make_user(db_session)
    r = client.post(
        "/api/v1/habits",
        json=_habit_body(recurrence_rule={"type": "weekly", "days": [1]}),
        headers=auth_headers(user.id),
    )
    hid = r.json()["id"]
    sunday = date(2026, 4, 5).isoformat()
    r = client.post(
        f"/api/v1/habits/{hid}/logs",
        json={"status": "missed", "date": sunday},
        headers=auth_headers(user.id),
    )
    assert r.status_code == 400


def test_log_micro_without_micro_step_returns_400(client, db_session):
    user = make_user(db_session)
    r = client.post(
        "/api/v1/habits",
        json=_habit_body(micro_step=None),
        headers=auth_headers(user.id),
    )
    hid = r.json()["id"]
    r = client.post(
        f"/api/v1/habits/{hid}/logs",
        json={"status": "micro"},
        headers=auth_headers(user.id),
    )
    assert r.status_code == 400


def test_profile_get_update_settings(client, db_session):
    user = make_user(db_session)
    r = client.get("/api/v1/profile", headers=auth_headers(user.id))
    assert r.status_code == 200
    data = r.json()
    assert data["user"]["email"] == user.email
    assert data["subscription_plan"] == "free"

    r = client.put(
        "/api/v1/profile",
        json={"name": "New Name"},
        headers=auth_headers(user.id),
    )
    assert r.status_code == 200
    assert r.json()["name"] == "New Name"

    r = client.put(
        "/api/v1/profile/settings",
        json={"global_enabled": False, "reminder_tone": "soft"},
        headers=auth_headers(user.id),
    )
    assert r.status_code == 200
    assert r.json()["global_enabled"] is False
    assert r.json()["reminder_tone"] == "soft"


def test_profile_change_password(client, db_session, monkeypatch):
    """Stub password helpers for a focused change-password flow test."""

    def hp(p: str) -> str:
        return f"stub:{p}"

    def vp(plain: str, hashed: str | None) -> bool:
        return bool(hashed) and hashed == f"stub:{plain}"

    monkeypatch.setattr("app.security.hash_password", hp)
    monkeypatch.setattr("app.security.verify_password", vp)
    monkeypatch.setattr("app.routers.profile.hash_password", hp)
    monkeypatch.setattr("app.routers.profile.verify_password", vp)

    user = make_user(db_session, password="oldpass123")
    r = client.post(
        "/api/v1/profile/change-password",
        json={"old_password": "wrong", "new_password": "newpass123"},
        headers=auth_headers(user.id),
    )
    assert r.status_code == 400

    r = client.post(
        "/api/v1/profile/change-password",
        json={"old_password": "oldpass123", "new_password": "newpass123"},
        headers=auth_headers(user.id),
    )
    assert r.status_code == 200


def test_profile_change_password_oauth_user(client, db_session):
    user = make_user(db_session, password=None)
    r = client.post(
        "/api/v1/profile/change-password",
        json={"old_password": "x", "new_password": "newpass123"},
        headers=auth_headers(user.id),
    )
    assert r.status_code == 400


def test_profile_email_conflict(client, db_session):
    a = make_user(db_session, email="a_conflict@example.com")
    make_user(db_session, email="b_conflict@example.com")
    r = client.put(
        "/api/v1/profile",
        json={"email": "b_conflict@example.com"},
        headers=auth_headers(a.id),
    )
    assert r.status_code == 400


def test_calendar_month_and_day(client, db_session):
    user = make_user(db_session)
    r = client.post("/api/v1/habits", json=_habit_body(), headers=auth_headers(user.id))
    assert r.status_code == 201

    r = client.get(
        "/api/v1/calendar",
        params={"year": 2026, "month": 4},
        headers=auth_headers(user.id),
    )
    assert r.status_code == 200
    days = r.json()["days"]
    assert len(days) == 30

    r = client.get(
        "/api/v1/calendar/day",
        params={"date": "2026-04-05"},
        headers=auth_headers(user.id),
    )
    assert r.status_code == 200
    assert r.json()["date"] == "2026-04-05"
    assert len(r.json()["habits"]) == 1


def test_free_plan_habit_limit(client, db_session):
    user = make_user(db_session, plan=SubscriptionPlan.free)
    for i in range(5):
        r = client.post(
            "/api/v1/habits",
            json=_habit_body(title=f"H{i}"),
            headers=auth_headers(user.id),
        )
        assert r.status_code == 201
    r = client.post(
        "/api/v1/habits",
        json=_habit_body(title="Too many"),
        headers=auth_headers(user.id),
    )
    assert r.status_code == 403


def test_premium_plan_more_than_five_habits(client, db_session):
    user = make_user(db_session, plan=SubscriptionPlan.premium)
    for i in range(6):
        r = client.post(
            "/api/v1/habits",
            json=_habit_body(title=f"P{i}"),
            headers=auth_headers(user.id),
        )
        assert r.status_code == 201


def test_other_users_habit_returns_404(client, db_session):
    owner = make_user(db_session)
    other = make_user(db_session)
    r = client.post("/api/v1/habits", json=_habit_body(), headers=auth_headers(owner.id))
    hid = r.json()["id"]

    r = client.get(f"/api/v1/habits/{hid}", headers=auth_headers(other.id))
    assert r.status_code == 404

    r = client.put(
        f"/api/v1/habits/{hid}",
        json=_habit_body(title="hack"),
        headers=auth_headers(other.id),
    )
    assert r.status_code == 404

    r = client.delete(f"/api/v1/habits/{hid}", headers=auth_headers(other.id))
    assert r.status_code == 404

    r = client.get(f"/api/v1/habits/{hid}/logs", headers=auth_headers(other.id))
    assert r.status_code == 404


def test_invalid_habit_uuid_path(client, db_session):
    user = make_user(db_session)
    r = client.get(f"/api/v1/habits/{uuid4()}", headers=auth_headers(user.id))
    assert r.status_code == 404
