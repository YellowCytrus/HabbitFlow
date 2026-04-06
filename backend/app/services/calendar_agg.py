import calendar
from datetime import date
from uuid import UUID

from sqlalchemy.orm import Session

from app.models import Habit, HabitLog, HabitLogStatus
from app.schemas import CalendarDayOut, DayDetailsOut, DayHabitStatusOut
from app.services.recurrence import is_habit_due_on


def _intensity_from_ratio(ratio: float) -> int:
    if ratio >= 1.0:
        return 4
    if ratio >= 0.75:
        return 3
    if ratio >= 0.5:
        return 2
    if ratio > 0:
        return 1
    return 0


def month_calendar(
    db: Session,
    user_id: UUID,
    year: int,
    month: int,
) -> list[CalendarDayOut]:
    habits: list[Habit] = db.query(Habit).filter(Habit.user_id == user_id).all()
    _, last_day = calendar.monthrange(year, month)
    start = date(year, month, 1)
    end = date(year, month, last_day)

    logs_by_habit: dict[UUID, dict[date, HabitLogStatus]] = {}
    for h in habits:
        rows = (
            db.query(HabitLog)
            .filter(HabitLog.habit_id == h.id, HabitLog.log_date >= start, HabitLog.log_date <= end)
            .all()
        )
        logs_by_habit[h.id] = {r.log_date: r.status for r in rows}

    out: list[CalendarDayOut] = []
    d = start
    while d <= end:
        due = [h for h in habits if is_habit_due_on(h.recurrence_rule or {}, d)]
        if not due:
            out.append(CalendarDayOut(date=d, intensity=0))
        else:
            done = 0
            for h in due:
                st = logs_by_habit.get(h.id, {}).get(d)
                if st in (HabitLogStatus.full, HabitLogStatus.micro):
                    done += 1
            ratio = done / len(due)
            out.append(CalendarDayOut(date=d, intensity=_intensity_from_ratio(ratio)))
        d = date.fromordinal(d.toordinal() + 1)

    return out


def day_details(db: Session, user_id: UUID, day: date) -> DayDetailsOut:
    habits: list[Habit] = db.query(Habit).filter(Habit.user_id == user_id).all()
    due = [h for h in habits if is_habit_due_on(h.recurrence_rule or {}, day)]
    items: list[DayHabitStatusOut] = []
    for h in due:
        log = (
            db.query(HabitLog)
            .filter(HabitLog.habit_id == h.id, HabitLog.log_date == day)
            .first()
        )
        if log is None:
            items.append(DayHabitStatusOut(habit_id=h.id, title=h.title, status="none"))
        else:
            items.append(
                DayHabitStatusOut(habit_id=h.id, title=h.title, status=log.status.value)
            )
    return DayDetailsOut(date=day, habits=items)
