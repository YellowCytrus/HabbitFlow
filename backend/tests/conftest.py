"""Shared fixtures for API tests (PostgreSQL only — models use JSONB)."""

from __future__ import annotations

import os
import uuid
from datetime import date
from typing import Any, Generator

import pytest
from fastapi.testclient import TestClient
from sqlalchemy import create_engine, text
from sqlalchemy.engine import make_url
from sqlalchemy.orm import Session, sessionmaker

from app import models  # noqa: F401 — register models
from app.database import Base, get_db
from app.main import app
from app.models import (
    NotificationSettings,
    ReminderTone,
    SubscriptionPlan,
    User,
    UserRole,
    UserSubscription,
)
import app.security as app_security
from app.security import create_access_token


def _ensure_database_exists(url: str) -> None:
    u = make_url(url)
    dbname = u.database
    if not dbname:
        return
    admin = u.set(database="postgres")
    eng = create_engine(str(admin), isolation_level="AUTOCOMMIT")
    with eng.connect() as conn:
        exists = conn.execute(
            text("SELECT 1 FROM pg_database WHERE datname = :n"),
            {"n": dbname},
        ).scalar()
        if not exists:
            ident = conn.dialect.identifier_preparer.quote(dbname)
            conn.execute(text(f"CREATE DATABASE {ident}"))


def _postgres_url_and_container() -> tuple[str, Any]:
    """Use TEST_DATABASE_URL when set; otherwise start Postgres via testcontainers."""
    raw = os.environ.get("TEST_DATABASE_URL", "").strip()
    if raw:
        return raw, None
    try:
        from testcontainers.postgres import PostgresContainer
    except ImportError as exc:
        pytest.fail(
            "Missing testcontainers. Install dev deps: `uv sync --extra dev`. "
            f"Or set TEST_DATABASE_URL. Import error: {exc}"
        )
    container = PostgresContainer(
        "postgres:16-alpine",
        username="habitflow",
        password="habitflow",
        dbname="habitflow_test",
    )
    try:
        container.start()
    except Exception as exc:
        pytest.fail(
            "Could not start PostgreSQL in Docker (testcontainers). "
            "Start Docker, or set TEST_DATABASE_URL to a reachable server. "
            f"Error: {exc}"
        )
    return container.get_connection_url(), container


@pytest.fixture(scope="session")
def engine():
    url, container = _postgres_url_and_container()
    eng = None
    try:
        try:
            _ensure_database_exists(url)
        except Exception:
            pass
        try:
            eng = create_engine(url, pool_pre_ping=True)
            with eng.connect() as conn:
                conn.execute(text("SELECT 1"))
        except Exception as exc:
            pytest.fail(
                f"PostgreSQL connection failed ({url!r}): {exc}. "
                "Fix TEST_DATABASE_URL or ensure Docker can pull/run postgres:16-alpine."
            )
        Base.metadata.create_all(bind=eng)
        yield eng
    finally:
        if eng is not None:
            Base.metadata.drop_all(bind=eng)
            eng.dispose()
        if container is not None:
            container.stop()


def _truncate_all(conn) -> None:
    conn.execute(
        text(
            "TRUNCATE TABLE habit_logs, habits, notification_settings, "
            "user_subscriptions, pending_registrations, users, messages RESTART IDENTITY CASCADE"
        )
    )


@pytest.fixture
def db_session(engine) -> Generator[Session, None, None]:
    session = sessionmaker(bind=engine, autoflush=False, autocommit=False)()
    yield session
    session.close()
    with engine.begin() as conn:
        _truncate_all(conn)


@pytest.fixture
def client(db_session: Session) -> Generator[TestClient, None, None]:
    def _override_db():
        yield db_session

    app.dependency_overrides[get_db] = _override_db
    with TestClient(app) as tc:
        yield tc
    app.dependency_overrides.clear()


def make_user(
    db: Session,
    *,
    email: str | None = None,
    password: str | None = None,
    is_active: bool = True,
    is_verified: bool = True,
    plan: SubscriptionPlan = SubscriptionPlan.free,
) -> User:
    email = email or f"{uuid.uuid4().hex}@example.com"
    user = User(
        email=email.lower(),
        password_hash=app_security.hash_password(password) if password else None,
        name="Test User",
        role=UserRole.user,
        is_active=is_active,
        is_verified=is_verified,
    )
    db.add(user)
    db.flush()
    db.add(
        NotificationSettings(
            user_id=user.id,
            global_enabled=True,
            reminder_tone=ReminderTone.neutral,
        )
    )
    db.add(
        UserSubscription(
            user_id=user.id,
            plan=plan,
            start_date=date.today(),
            auto_renew=False,
        )
    )
    db.commit()
    db.refresh(user)
    return user


def auth_headers(user_id) -> dict[str, str]:
    return {"Authorization": f"Bearer {create_access_token(user_id)}"}
