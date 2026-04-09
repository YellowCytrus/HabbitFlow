from datetime import datetime, time, timezone

from app.services.notification_scheduler import (
    compute_delay_seconds,
    compute_next_goal_datetime_utc,
    compute_next_goal_for_reminder,
)


def test_compute_delay_seconds_from_utc_values():
    now = datetime(2026, 4, 7, 9, 0, tzinfo=timezone.utc)
    goal = datetime(2026, 4, 7, 9, 5, tzinfo=timezone.utc)
    assert compute_delay_seconds(goal, now) == 300


def test_compute_next_goal_datetime_uses_user_timezone_daily():
    # 09:00 UTC == 12:00 Europe/Moscow in April.
    current_goal_utc = datetime(2026, 4, 7, 9, 0, tzinfo=timezone.utc)
    next_goal_utc = compute_next_goal_datetime_utc(
        current_goal_utc=current_goal_utc,
        user_timezone="Europe/Moscow",
        recurrence_rule={"type": "daily"},
    )
    assert next_goal_utc == datetime(2026, 4, 8, 9, 0, tzinfo=timezone.utc)


def test_compute_next_goal_for_weekly_rule():
    # Monday in UTC/local timezone.
    now = datetime(2026, 4, 6, 7, 0, tzinfo=timezone.utc)
    nxt = compute_next_goal_for_reminder(
        now_utc=now,
        reminder_time=time(9, 0),
        recurrence_rule={"type": "weekly", "days": [3]},  # Wednesday
        user_timezone="UTC",
    )
    assert nxt == datetime(2026, 4, 8, 9, 0, tzinfo=timezone.utc)
