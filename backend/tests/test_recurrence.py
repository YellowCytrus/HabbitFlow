from datetime import date

from app.services.recurrence import is_habit_due_on


def test_daily_always_due():
    assert is_habit_due_on({"type": "daily"}, date(2026, 4, 5)) is True


def test_weekly_monday():
    # 2026-04-06 is Monday (ISO weekday 1)
    d = date(2026, 4, 6)
    assert is_habit_due_on({"type": "weekly", "days": [1]}, d) is True
    assert is_habit_due_on({"type": "weekly", "days": [2]}, d) is False
