from datetime import date as Date
from datetime import datetime, time
from typing import Any
from uuid import UUID
from zoneinfo import ZoneInfo

from pydantic import BaseModel, EmailStr, Field, field_validator

from app.models import DeadlineType, HabitLogStatus, ReminderTone, SubscriptionPlan, UserRole


class TokenPair(BaseModel):
    access_token: str
    refresh_token: str
    token_type: str = "bearer"


class AccessTokenBody(BaseModel):
    access_token: str
    token_type: str = "bearer"


class RegisterRequest(BaseModel):
    email: EmailStr
    password: str = Field(min_length=8)
    name: str = Field(min_length=1, max_length=200)


class LoginRequest(BaseModel):
    email: EmailStr
    password: str


class VerifyEmailRequest(BaseModel):
    token: str


class VerifyRegistrationRequest(BaseModel):
    email: EmailStr
    code: str = Field(min_length=6, max_length=6, pattern=r"^\d{6}$")


class ResendRegistrationCodeRequest(BaseModel):
    email: EmailStr


class RefreshRequest(BaseModel):
    refresh_token: str


class UserPublic(BaseModel):
    id: UUID
    email: str
    name: str
    avatar_url: str | None
    role: UserRole
    is_verified: bool

    model_config = {"from_attributes": True}


class RecurrenceRule(BaseModel):
    type: str = "daily"
    days: list[int] | None = None

    def to_json(self) -> dict[str, Any]:
        d: dict[str, Any] = {"type": self.type}
        if self.days is not None:
            d["days"] = self.days
        return d


class HabitCreate(BaseModel):
    title: str = Field(min_length=1, max_length=500)
    main_goal: str = Field(min_length=1)
    micro_step: str | None = None
    reminder_time: time | None = None
    adaptive_reminder: bool = False
    recurrence_rule: dict[str, Any]
    deadline_type: DeadlineType | None = None
    deadline_value: str | None = Field(default=None, min_length=1, max_length=100)


class HabitUpdate(HabitCreate):
    pass


class HabitOut(BaseModel):
    id: UUID
    user_id: UUID
    title: str
    main_goal: str
    micro_step: str | None
    reminder_time: time | None
    adaptive_reminder: bool
    recurrence_rule: dict[str, Any]
    deadline_type: DeadlineType | None
    deadline_value: str | None
    created_at: datetime
    updated_at: datetime

    model_config = {"from_attributes": True}


class HabitDetailOut(HabitOut):
    streak: int = 0
    completion_rate_30d: float = 0.0
    micro_usage_count: int = 0


class HabitLogCreate(BaseModel):
    status: HabitLogStatus
    date: Date | None = None

    @field_validator("status")
    @classmethod
    def allow_log_status(cls, v: HabitLogStatus) -> HabitLogStatus:
        if v not in (HabitLogStatus.full, HabitLogStatus.micro, HabitLogStatus.missed):
            raise ValueError("Invalid log status")
        return v


class HabitLogOut(BaseModel):
    id: UUID
    habit_id: UUID
    date: Date
    status: HabitLogStatus
    notes: str | None
    created_at: datetime

    model_config = {"from_attributes": True}

    @classmethod
    def from_orm_log(cls, log: Any) -> "HabitLogOut":
        return cls(
            id=log.id,
            habit_id=log.habit_id,
            date=log.log_date,
            status=log.status,
            notes=log.notes,
            created_at=log.created_at,
        )


class NotificationSettingsOut(BaseModel):
    global_enabled: bool
    quiet_hours_start: time | None
    quiet_hours_end: time | None
    reminder_tone: ReminderTone
    micro_step_frequency: str | None
    user_timezone: str

    model_config = {"from_attributes": True}


class ProfileOut(BaseModel):
    user: UserPublic
    settings: NotificationSettingsOut
    subscription_plan: SubscriptionPlan


class ProfileUpdate(BaseModel):
    name: str | None = Field(default=None, min_length=1, max_length=200)
    email: EmailStr | None = None


class SettingsUpdate(BaseModel):
    global_enabled: bool | None = None
    quiet_hours_start: time | None = None
    quiet_hours_end: time | None = None
    reminder_tone: ReminderTone | None = None
    user_timezone: str | None = None

    @field_validator("user_timezone")
    @classmethod
    def validate_timezone(cls, v: str | None) -> str | None:
        if v is None:
            return None
        try:
            ZoneInfo(v)
        except Exception as exc:
            raise ValueError("Invalid IANA timezone") from exc
        return v


class ChangePasswordRequest(BaseModel):
    old_password: str
    new_password: str = Field(min_length=8)


class CalendarDayOut(BaseModel):
    date: Date
    intensity: int = Field(ge=0, le=4)


class CalendarMonthOut(BaseModel):
    days: list[CalendarDayOut]


class DayHabitStatusOut(BaseModel):
    habit_id: UUID
    title: str
    status: str  # full | micro | missed | none


class DayDetailsOut(BaseModel):
    date: Date
    habits: list[DayHabitStatusOut]
