from __future__ import annotations

from datetime import datetime, timezone
from uuid import UUID

from sqlalchemy import update
from sqlalchemy.orm import Session

from app.models import Notification, NotificationLog
from app.services.notification_scheduler import compute_delay_seconds, compute_next_goal_datetime_utc


def acquire_processing_lock(db: Session, notification_id: UUID) -> bool:
    result = db.execute(
        update(Notification)
        .where(Notification.id == notification_id, Notification.is_processing.is_(False))
        .values(is_processing=True)
    )
    db.commit()
    return result.rowcount == 1


def process_notification(
    db: Session,
    *,
    notification_id: UUID,
    now_utc: datetime,
    sender,
    enqueue,
) -> str:
    if not acquire_processing_lock(db, notification_id):
        return "locked"
    n = db.query(Notification).filter(Notification.id == notification_id).first()
    if n is None or not n.is_active:
        if n is not None:
            n.is_processing = False
            n.last_check_at = now_utc
            db.commit()
        return "inactive"

    if n.goal_datetime > now_utc:
        n.is_processing = False
        n.last_check_at = now_utc
        db.commit()
        return "not_due"

    is_sent = bool(sender(n.payload))
    db.add(
        NotificationLog(
            notification_id=n.id,
            sent_at=now_utc,
            is_sent=is_sent,
            payload=n.payload,
        )
    )
    n.goal_datetime = compute_next_goal_datetime_utc(
        current_goal_utc=n.goal_datetime,
        user_timezone=n.user_timezone,
        recurrence_rule=n.recurrence_rule or {"type": "daily"},
    )
    n.last_check_at = now_utc
    n.is_processing = False
    db.commit()
    enqueue(n.id, compute_delay_seconds(n.goal_datetime, now_utc))
    return "sent" if is_sent else "failed"


def default_sender(_payload: dict) -> bool:
    return True


def default_enqueue(_notification_id: UUID, _delay_seconds: int) -> None:
    return None


def utcnow() -> datetime:
    return datetime.now(timezone.utc)
