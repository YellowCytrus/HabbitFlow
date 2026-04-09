from __future__ import annotations

from datetime import datetime, timezone

from sqlalchemy.orm import Session

from app.models import Habit, Notification, NotificationSettings
from app.services.notification_scheduler import compute_next_goal_for_reminder


def sync_habit_notification(db: Session, habit: Habit) -> None:
    settings = db.query(NotificationSettings).filter(NotificationSettings.user_id == habit.user_id).first()
    user_timezone = settings.user_timezone if settings and settings.user_timezone else "UTC"
    existing = db.query(Notification).filter(Notification.habit_id == habit.id).first()
    if habit.reminder_time is None:
        if existing:
            existing.is_active = False
        return

    goal = compute_next_goal_for_reminder(
        now_utc=datetime.now(timezone.utc),
        reminder_time=habit.reminder_time,
        recurrence_rule=habit.recurrence_rule or {"type": "daily"},
        user_timezone=user_timezone,
    )
    payload = {
        "habit_id": str(habit.id),
        "title": habit.title,
        "body": f"Напоминание: {habit.title}",
    }
    if existing:
        existing.goal_datetime = goal
        existing.payload = payload
        existing.recurrence_rule = habit.recurrence_rule or {"type": "daily"}
        existing.user_timezone = user_timezone
        existing.is_active = True
    else:
        db.add(
            Notification(
                user_id=habit.user_id,
                habit_id=habit.id,
                goal_datetime=goal,
                payload=payload,
                recurrence_rule=habit.recurrence_rule or {"type": "daily"},
                is_active=True,
                user_timezone=user_timezone,
            )
        )


def deactivate_habit_notification(db: Session, habit_id) -> None:
    existing = db.query(Notification).filter(Notification.habit_id == habit_id).first()
    if existing:
        existing.is_active = False


def due_notifications_for_user(db: Session, user_id, *, now_utc: datetime, limit: int = 50) -> list[dict]:
    rows = (
        db.query(Notification)
        .filter(
            Notification.user_id == user_id,
            Notification.is_active.is_(True),
            Notification.is_processing.is_(False),
            Notification.goal_datetime <= now_utc,
        )
        .order_by(Notification.goal_datetime.asc())
        .limit(limit)
        .all()
    )
    out = []
    for n in rows:
        idempotency_key = f"{n.id}:{n.goal_datetime.isoformat()}"
        out.append(
            {
                "notification_id": str(n.id),
                "goal_datetime": n.goal_datetime.isoformat(),
                "idempotency_key": idempotency_key,
                "payload": n.payload,
            }
        )
    return out
