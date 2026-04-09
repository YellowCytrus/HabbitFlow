from datetime import datetime, timedelta, timezone

from app.models import Notification
from app.services.notification_self_healing import run_self_healing

from .conftest import make_user


def test_self_healing_unlocks_stale_processing(db_session):
    user = make_user(db_session)
    n = Notification(
        user_id=user.id,
        goal_datetime=datetime(2026, 4, 7, 9, 0, tzinfo=timezone.utc),
        payload={"title": "Read"},
        is_processing=True,
        last_check_at=datetime(2026, 4, 7, 8, 0, tzinfo=timezone.utc),
        user_timezone="UTC",
    )
    db_session.add(n)
    db_session.commit()

    run_self_healing(
        db_session,
        now_utc=datetime(2026, 4, 7, 9, 0, tzinfo=timezone.utc),
        enqueue=lambda _id, _delay: None,
        sender=lambda _payload: True,
        stale_after=timedelta(minutes=10),
    )
    db_session.refresh(n)
    assert n.is_processing is False


def test_self_healing_reschedules_missed_notification(db_session):
    user = make_user(db_session)
    n = Notification(
        user_id=user.id,
        goal_datetime=datetime(2026, 4, 7, 8, 30, tzinfo=timezone.utc),
        payload={"title": "Read"},
        user_timezone="UTC",
        recurrence_rule={"type": "daily"},
    )
    db_session.add(n)
    db_session.commit()
    db_session.refresh(n)

    enqueued = []

    run_self_healing(
        db_session,
        now_utc=datetime(2026, 4, 7, 9, 0, tzinfo=timezone.utc),
        enqueue=lambda notification_id, delay: enqueued.append((notification_id, delay)),
        sender=lambda _payload: True,
    )

    db_session.refresh(n)
    assert n.goal_datetime == datetime(2026, 4, 8, 8, 30, tzinfo=timezone.utc)
    assert len(enqueued) == 1
