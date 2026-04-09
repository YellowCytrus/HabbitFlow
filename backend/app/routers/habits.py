from datetime import date, datetime, timedelta
from typing import Annotated
from uuid import UUID

from fastapi import APIRouter, Depends, HTTPException, Query, status
from sqlalchemy.orm import Session

from app.database import get_db
from app.deps import CurrentUser
from app.models import Habit, HabitLog, HabitLogStatus, SubscriptionPlan, UserSubscription
from app.schemas import HabitCreate, HabitDetailOut, HabitLogCreate, HabitLogOut, HabitOut
from app.services.deadlines import is_micro_allowed, is_within_full_deadline
from app.services.notification_service import deactivate_habit_notification, sync_habit_notification
from app.services.recurrence import is_habit_due_on
from app.services.streak import completion_rate_for_range, compute_streak, count_micro_usage

router = APIRouter(prefix="/habits", tags=["habits"])


def _habit_out(h: Habit) -> HabitOut:
    return HabitOut.model_validate(h)


def _habit_detail(db: Session, h: Habit) -> HabitDetailOut:
    end = date.today()
    start = end - timedelta(days=29)
    return HabitDetailOut(
        **_habit_out(h).model_dump(),
        streak=compute_streak(db, h, end),
        completion_rate_30d=completion_rate_for_range(db, h, start, end),
        micro_usage_count=count_micro_usage(db, h.id),
    )


def _get_owned_habit(db: Session, user_id: UUID, habit_id: UUID) -> Habit:
    h = db.query(Habit).filter(Habit.id == habit_id, Habit.user_id == user_id).first()
    if not h:
        raise HTTPException(status_code=404, detail="Habit not found")
    return h


@router.get("", response_model=list[HabitOut])
def list_habits(
    db: Annotated[Session, Depends(get_db)],
    user: CurrentUser,
    for_date: date | None = Query(None),
    limit: int = Query(100, ge=1, le=500),
    offset: int = Query(0, ge=0),
):
    q = db.query(Habit).filter(Habit.user_id == user.id).order_by(Habit.created_at.desc())
    rows = q.offset(offset).limit(limit).all()
    if for_date is None:
        return [_habit_out(h) for h in rows]
    return [_habit_out(h) for h in rows if is_habit_due_on(h.recurrence_rule or {}, for_date)]


@router.post("", response_model=HabitOut, status_code=status.HTTP_201_CREATED)
def create_habit(db: Annotated[Session, Depends(get_db)], user: CurrentUser, body: HabitCreate):
    sub = db.query(UserSubscription).filter(UserSubscription.user_id == user.id).first()
    plan = sub.plan if sub else SubscriptionPlan.free
    count = db.query(Habit).filter(Habit.user_id == user.id).count()
    if plan == SubscriptionPlan.free and count >= 5:
        raise HTTPException(
            status_code=403,
            detail="Upgrade to premium to add more habits",
        )
    h = Habit(
        user_id=user.id,
        title=body.title,
        main_goal=body.main_goal,
        micro_step=body.micro_step,
        reminder_time=body.reminder_time,
        adaptive_reminder=body.adaptive_reminder,
        recurrence_rule=body.recurrence_rule,
        deadline_type=body.deadline_type,
        deadline_value=body.deadline_value,
    )
    db.add(h)
    db.flush()
    sync_habit_notification(db, h)
    db.commit()
    db.refresh(h)
    return _habit_out(h)


@router.get("/{habit_id}", response_model=HabitDetailOut)
def get_habit(db: Annotated[Session, Depends(get_db)], user: CurrentUser, habit_id: UUID):
    h = _get_owned_habit(db, user.id, habit_id)
    return _habit_detail(db, h)


@router.put("/{habit_id}", response_model=HabitOut)
def update_habit(db: Annotated[Session, Depends(get_db)], user: CurrentUser, habit_id: UUID, body: HabitCreate):
    h = _get_owned_habit(db, user.id, habit_id)
    h.title = body.title
    h.main_goal = body.main_goal
    h.micro_step = body.micro_step
    h.reminder_time = body.reminder_time
    h.adaptive_reminder = body.adaptive_reminder
    h.recurrence_rule = body.recurrence_rule
    h.deadline_type = body.deadline_type
    h.deadline_value = body.deadline_value
    sync_habit_notification(db, h)
    db.commit()
    db.refresh(h)
    return _habit_out(h)


@router.delete("/{habit_id}")
def delete_habit(db: Annotated[Session, Depends(get_db)], user: CurrentUser, habit_id: UUID):
    h = _get_owned_habit(db, user.id, habit_id)
    deactivate_habit_notification(db, h.id)
    db.delete(h)
    db.commit()
    return {"success": True}


@router.get("/{habit_id}/logs", response_model=list[HabitLogOut])
def list_logs(
    db: Annotated[Session, Depends(get_db)],
    user: CurrentUser,
    habit_id: UUID,
    from_: date | None = Query(None, alias="from"),
    to: date | None = Query(None),
    limit: int = Query(200, ge=1, le=1000),
    offset: int = Query(0, ge=0),
):
    _get_owned_habit(db, user.id, habit_id)
    q = db.query(HabitLog).filter(HabitLog.habit_id == habit_id)
    if from_ is not None:
        q = q.filter(HabitLog.log_date >= from_)
    if to is not None:
        q = q.filter(HabitLog.log_date <= to)
    rows = q.order_by(HabitLog.log_date.desc()).offset(offset).limit(limit).all()
    return [HabitLogOut.from_orm_log(r) for r in rows]


@router.post("/{habit_id}/logs", response_model=HabitLogOut)
def upsert_log(
    db: Annotated[Session, Depends(get_db)],
    user: CurrentUser,
    habit_id: UUID,
    body: HabitLogCreate,
):
    h = _get_owned_habit(db, user.id, habit_id)
    log_date = body.date or date.today()
    if not is_habit_due_on(h.recurrence_rule or {}, log_date):
        raise HTTPException(status_code=400, detail="Habit is not scheduled for this date")

    if body.status == HabitLogStatus.micro and not (h.micro_step and h.micro_step.strip()):
        raise HTTPException(status_code=400, detail="This habit has no micro-step defined")

    now = datetime.now()
    if body.status == HabitLogStatus.full:
        if not is_within_full_deadline(h, now, log_date):
            raise HTTPException(status_code=400, detail="Deadline passed")
    elif body.status == HabitLogStatus.micro:
        if not is_micro_allowed(now, log_date):
            raise HTTPException(status_code=400, detail="Deadline passed")
    elif body.status == HabitLogStatus.missed:
        pass
    else:
        raise HTTPException(status_code=400, detail="Invalid status for log upsert")

    existing = db.query(HabitLog).filter(HabitLog.habit_id == habit_id, HabitLog.log_date == log_date).first()
    if existing:
        existing.status = body.status
        db.commit()
        db.refresh(existing)
        return HabitLogOut.from_orm_log(existing)
    log = HabitLog(habit_id=habit_id, log_date=log_date, status=body.status)
    db.add(log)
    db.commit()
    db.refresh(log)
    return HabitLogOut.from_orm_log(log)
