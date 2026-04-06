from datetime import date, timedelta
from typing import Any

from sqlalchemy.orm import Session

from app.models import Habit, HabitLog, HabitLogStatus
from app.services.recurrence import is_habit_due_on


def _log_map_for_habit(db: Session, habit_id: Any, start: date, end: date) -> dict[date, HabitLogStatus]:
    rows = (
        db.query(HabitLog)
        .filter(
            HabitLog.habit_id == habit_id,
            HabitLog.log_date >= start,
            HabitLog.log_date <= end,
        )
        .all()
    )
    return {r.log_date: r.status for r in rows}


def compute_streak(db: Session, habit: Habit, end_on: date | None = None) -> int:
    """Consecutive due days with full or micro, ending at end_on. Missed or incomplete past days break."""
    end = end_on or date.today()
    streak = 0
    d = end
    rule = habit.recurrence_rule or {}
    logs = _log_map_for_habit(db, habit.id, end - timedelta(days=800), end)
    today = date.today()

    while (end - d).days <= 800:
        if not is_habit_due_on(rule, d):
            d -= timedelta(days=1)
            continue
        st = logs.get(d)
        if st in (HabitLogStatus.full, HabitLogStatus.micro):
            streak += 1
            d -= timedelta(days=1)
            continue
        if d == today:
            d -= timedelta(days=1)
            continue
        if st == HabitLogStatus.missed or st is None:
            break
        d -= timedelta(days=1)

    return streak


def completion_rate_for_range(db: Session, habit: Habit, start: date, end: date) -> float:
    due_days = 0
    done = 0
    rule = habit.recurrence_rule or {}
    d = start
    logs = _log_map_for_habit(db, habit.id, start, end)
    while d <= end:
        if is_habit_due_on(rule, d):
            due_days += 1
            st = logs.get(d)
            if st in (HabitLogStatus.full, HabitLogStatus.micro):
                done += 1
        d += timedelta(days=1)
    if due_days == 0:
        return 0.0
    return done / due_days


def count_micro_usage(db: Session, habit_id: Any) -> int:
    return (
        db.query(HabitLog)
        .filter(HabitLog.habit_id == habit_id, HabitLog.status == HabitLogStatus.micro)
        .count()
    )
