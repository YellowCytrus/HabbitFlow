from datetime import date
from typing import Any


def is_habit_due_on(rule: dict[str, Any] | None, d: date) -> bool:
    if not rule:
        return True
    t = rule.get("type", "daily")
    if t == "daily":
        return True
    if t == "weekly":
        days = rule.get("days", [])
        return d.isoweekday() in days
    return True
