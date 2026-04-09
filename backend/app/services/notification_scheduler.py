from __future__ import annotations

from datetime import datetime, time, timedelta, timezone
from zoneinfo import ZoneInfo


def _safe_tz(name: str) -> ZoneInfo:
    try:
        return ZoneInfo(name)
    except Exception:
        return ZoneInfo("UTC")


def compute_delay_seconds(goal_datetime_utc: datetime, now_utc: datetime) -> int:
    return max(0, int((goal_datetime_utc - now_utc).total_seconds()))


def compute_next_goal_datetime_utc(
    *,
    current_goal_utc: datetime,
    user_timezone: str,
    recurrence_rule: dict,
) -> datetime:
    tz = _safe_tz(user_timezone)
    local_goal = current_goal_utc.astimezone(tz)
    rule_type = (recurrence_rule or {}).get("type", "daily")
    if rule_type == "weekly":
        days = sorted((recurrence_rule or {}).get("days", []))
        if not days:
            local_next = local_goal + timedelta(days=7)
        else:
            cur = local_goal.isoweekday()
            bigger = [d for d in days if d > cur]
            if bigger:
                delta = bigger[0] - cur
            else:
                delta = 7 - cur + days[0]
            local_next = local_goal + timedelta(days=delta)
    else:
        local_next = local_goal + timedelta(days=1)
    return local_next.astimezone(timezone.utc)


def compute_next_goal_for_reminder(
    *,
    now_utc: datetime,
    reminder_time: time,
    recurrence_rule: dict,
    user_timezone: str,
) -> datetime:
    tz = _safe_tz(user_timezone)
    now_local = now_utc.astimezone(tz)
    candidate_local = now_local.replace(
        hour=reminder_time.hour,
        minute=reminder_time.minute,
        second=reminder_time.second,
        microsecond=0,
    )
    rule_type = (recurrence_rule or {}).get("type", "daily")
    if rule_type == "weekly":
        days = sorted((recurrence_rule or {}).get("days", []))
        if not days:
            days = [candidate_local.isoweekday()]
        for add in range(0, 8):
            check = candidate_local + timedelta(days=add)
            if check.isoweekday() in days and check > now_local:
                return check.astimezone(timezone.utc)
        return (candidate_local + timedelta(days=7)).astimezone(timezone.utc)
    if candidate_local <= now_local:
        candidate_local = candidate_local + timedelta(days=1)
    return candidate_local.astimezone(timezone.utc)
