from datetime import date
from typing import Annotated

from fastapi import APIRouter, Depends, Query
from sqlalchemy.orm import Session

from app.database import get_db
from app.deps import CurrentUser
from app.schemas import CalendarMonthOut, DayDetailsOut
from app.services.calendar_agg import day_details, month_calendar

router = APIRouter(prefix="/calendar", tags=["calendar"])


@router.get("", response_model=CalendarMonthOut)
def calendar_month(
    db: Annotated[Session, Depends(get_db)],
    user: CurrentUser,
    year: int = Query(..., ge=2000, le=2100),
    month: int = Query(..., ge=1, le=12),
):
    days = month_calendar(db, user.id, year, month)
    return CalendarMonthOut(days=days)


@router.get("/day", response_model=DayDetailsOut)
def calendar_day(
    db: Annotated[Session, Depends(get_db)],
    user: CurrentUser,
    d: date = Query(..., alias="date"),
):
    return day_details(db, user.id, d)
