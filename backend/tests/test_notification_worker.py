from datetime import datetime, timezone

from app.models import Notification, NotificationLog
from app.services.notification_scheduler import compute_delay_seconds
from app.services.notification_worker import acquire_processing_lock, process_notification

from .conftest import make_user


def test_acquire_processing_lock_is_atomic(db_session):
    user = make_user(db_session)
    n = Notification(
        user_id=user.id,
        goal_datetime=datetime(2026, 4, 7, 9, 0, tzinfo=timezone.utc),
        payload={"title": "Read"},
        user_timezone="UTC",
    )
    db_session.add(n)
    db_session.commit()
    db_session.refresh(n)

    assert acquire_processing_lock(db_session, n.id) is True
    assert acquire_processing_lock(db_session, n.id) is False


def test_worker_processes_due_notification_and_reschedules(db_session):
    user = make_user(db_session)
    n = Notification(
        user_id=user.id,
        goal_datetime=datetime(2026, 4, 7, 9, 0, tzinfo=timezone.utc),
        payload={"title": "Read"},
        user_timezone="UTC",
        recurrence_rule={"type": "daily"},
    )
    db_session.add(n)
    db_session.commit()
    db_session.refresh(n)

    sent_payloads = []
    enqueued = []

    def sender(payload):
        sent_payloads.append(payload)
        return True

    def enqueue(notification_id, delay):
        enqueued.append((notification_id, delay))

    now = datetime(2026, 4, 7, 9, 0, tzinfo=timezone.utc)
    result = process_notification(
        db_session,
        notification_id=n.id,
        now_utc=now,
        sender=sender,
        enqueue=enqueue,
    )

    assert result == "sent"
    assert len(sent_payloads) == 1
    assert sent_payloads[0]["title"] == "Read"

    db_session.refresh(n)
    assert n.is_processing is False
    assert n.goal_datetime == datetime(2026, 4, 8, 9, 0, tzinfo=timezone.utc)
    assert enqueued == [(n.id, compute_delay_seconds(n.goal_datetime, now))]

    logs = db_session.query(NotificationLog).filter(NotificationLog.notification_id == n.id).all()
    assert len(logs) == 1
    assert logs[0].is_sent is True
