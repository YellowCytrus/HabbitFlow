import re
from datetime import date, datetime, time, timedelta, timezone
from typing import Tuple
from zoneinfo import ZoneInfo

from app.models import DeadlineType, Habit


def _parse_hh_mm(s: str) -> time:
    parts = s.strip().split(":")
    h = int(parts[0])
    m = int(parts[1]) if len(parts) > 1 else 0
    sec = int(parts[2]) if len(parts) > 2 else 0
    return time(h, m, sec)


def parse_exact_window(deadline_value: str) -> Tuple[time, time]:
    """Parse 'HH:MM-HH:MM' or single time as end-of-window from 00:00."""
    raw = deadline_value.strip()
    m = re.match(r"^\s*(\d{1,2}:\d{2}(?::\d{2})?)\s*-\s*(\d{1,2}:\d{2}(?::\d{2})?)\s*$", raw)
    if m:
        return _parse_hh_mm(m.group(1)), _parse_hh_mm(m.group(2))
    t = _parse_hh_mm(raw)
    return time(0, 0, 0), t


def slot_window_hours(slot: str) -> Tuple[int, int] | None:
    s = slot.lower().strip()
    if s == "morning":
        return 6, 12
    if s == "afternoon":
        return 12, 18
    if s == "evening":
        return 18, 23
    if s == "night":
        return 23, 6
    return None


def _safe_tz(name: str) -> ZoneInfo:
    try:
        return ZoneInfo(name)
    except Exception:
        return ZoneInfo("UTC")


def _as_utc(at: datetime) -> datetime:
    """Naive datetimes are treated as UTC (Docker / servers often use naive UTC)."""
    if at.tzinfo is None:
        return at.replace(tzinfo=timezone.utc)
    return at.astimezone(timezone.utc)


def is_within_full_deadline(
    habit: Habit,
    at: datetime,
    log_date: date,
    user_timezone: str = "UTC",
) -> bool:
    """Full completion allowed only inside deadline window for log_date in the user's timezone."""
    tz = _safe_tz(user_timezone)
    at_utc = _as_utc(at)
    at_local = at_utc.astimezone(tz)
    if at_local.date() != log_date:
        return False
    if habit.deadline_type is None or not habit.deadline_value:
        return True
    if habit.deadline_type == DeadlineType.exact:
        start_t, end_t = parse_exact_window(habit.deadline_value)
        start_local = datetime.combine(log_date, start_t, tzinfo=tz)
        end_local = datetime.combine(log_date, end_t, tzinfo=tz)
        if end_local <= start_local:
            end_local += timedelta(days=1)
        return start_local <= at_local <= end_local
    wh = slot_window_hours(habit.deadline_value)
    if not wh:
        return False
    start_h, end_h = wh
    h = at_local.hour
    if start_h < end_h:
        return start_h <= h < end_h
    return h >= start_h or h < end_h


def is_micro_allowed(at: datetime, log_date: date, user_timezone: str = "UTC") -> bool:
    """Micro-step allowed until end of log_date in the user's timezone (browser sends local calendar date)."""
    tz = _safe_tz(user_timezone)
    at_utc = _as_utc(at)
    at_local = at_utc.astimezone(tz)
    if at_local.date() != log_date:
        return False
    end_of_day = datetime.combine(log_date, time(23, 59, 59, 999000), tzinfo=tz)
    return at_local <= end_of_day
