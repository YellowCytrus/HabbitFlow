from datetime import date, datetime

from app.models import DeadlineType
from app.services.deadlines import is_micro_allowed, is_within_full_deadline, parse_exact_window, slot_window_hours


def test_parse_exact_window_range():
    a, b = parse_exact_window("07:00-07:30")
    assert a.hour == 7 and a.minute == 0
    assert b.hour == 7 and b.minute == 30


def test_parse_exact_window_single_end():
    a, b = parse_exact_window("21:00")
    assert a.hour == 0 and a.minute == 0
    assert b.hour == 21 and b.minute == 0


def test_slot_window_hours():
    assert slot_window_hours("morning") == (6, 12)
    assert slot_window_hours("night") == (23, 6)


class _H:
    def __init__(self, dtype, dval):
        self.deadline_type = dtype
        self.deadline_value = dval


def test_full_deadline_exact_inside():
    h = _H(DeadlineType.exact, "09:00-10:00")
    at = datetime(2026, 4, 5, 9, 30, 0)
    assert is_within_full_deadline(h, at, date(2026, 4, 5)) is True


def test_full_deadline_exact_outside():
    h = _H(DeadlineType.exact, "09:00-10:00")
    at = datetime(2026, 4, 5, 11, 0, 0)
    assert is_within_full_deadline(h, at, date(2026, 4, 5)) is False


def test_full_deadline_missing_allows_any_time():
    h = _H(None, None)
    at = datetime(2026, 4, 5, 11, 0, 0)
    assert is_within_full_deadline(h, at, date(2026, 4, 5)) is True


def test_micro_allowed_same_day():
    at = datetime(2026, 4, 5, 22, 0, 0)
    assert is_micro_allowed(at, date(2026, 4, 5)) is True


def test_micro_allowed_wrong_day():
    at = datetime(2026, 4, 5, 22, 0, 0)
    assert is_micro_allowed(at, date(2026, 4, 4)) is False
