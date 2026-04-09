from __future__ import annotations

from datetime import datetime, timedelta

from sqlalchemy.orm import Session

from app.models import Notification
from app.services.notification_scheduler import compute_delay_seconds, compute_next_goal_datetime_utc


def run_self_healing(
    db: Session,
    *,
    now_utc: datetime,
    enqueue,
    sender,
    stale_after: timedelta = timedelta(minutes=10),
    immediate_send_lag: timedelta = timedelta(hours=1),
) -> None:
    active = db.query(Notification).filter(Notification.is_active.is_(True)).all()
    for n in active:
        if n.is_processing and n.last_check_at < now_utc - stale_after:
            n.is_processing = False
            n.last_check_at = now_utc
            continue
        if n.is_processing:
            continue
        if n.goal_datetime >= now_utc:
            continue
        if now_utc - n.goal_datetime <= immediate_send_lag:
            sender(n.payload)
        n.goal_datetime = compute_next_goal_datetime_utc(
            current_goal_utc=n.goal_datetime,
            user_timezone=n.user_timezone,
            recurrence_rule=n.recurrence_rule or {"type": "daily"},
        )
        n.last_check_at = now_utc
        enqueue(n.id, compute_delay_seconds(n.goal_datetime, now_utc))
    db.commit()
