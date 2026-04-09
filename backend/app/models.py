import enum
import uuid
from datetime import date, datetime, time, timezone
from typing import TYPE_CHECKING

from sqlalchemy import (
    Boolean,
    Date,
    DateTime,
    Enum,
    ForeignKey,
    Integer,
    String,
    Text,
    Time,
    UniqueConstraint,
)
from sqlalchemy.dialects.postgresql import JSONB, UUID
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.database import Base

if TYPE_CHECKING:
    pass


class UserRole(str, enum.Enum):
    user = "user"
    admin = "admin"


class DeadlineType(str, enum.Enum):
    exact = "exact"
    slot = "slot"


class HabitLogStatus(str, enum.Enum):
    full = "full"
    micro = "micro"
    missed = "missed"


class ReminderTone(str, enum.Enum):
    soft = "soft"
    neutral = "neutral"


class SubscriptionPlan(str, enum.Enum):
    free = "free"
    premium = "premium"


class PendingRegistration(Base):
    """Email/password signup until the 6-digit code is confirmed — no User row yet."""

    __tablename__ = "pending_registrations"

    id: Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    email: Mapped[str] = mapped_column(String(320), unique=True, nullable=False, index=True)
    password_hash: Mapped[str] = mapped_column(String(255), nullable=False)
    name: Mapped[str] = mapped_column(String(200), nullable=False)
    verification_code_hash: Mapped[str] = mapped_column(String(255), nullable=False)
    verification_code_expires_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), nullable=False)
    created_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True), default=lambda: datetime.now(timezone.utc), nullable=False
    )


class User(Base):
    __tablename__ = "users"

    id: Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    email: Mapped[str] = mapped_column(String(320), unique=True, nullable=False, index=True)
    password_hash: Mapped[str | None] = mapped_column(String(255), nullable=True)
    name: Mapped[str] = mapped_column(String(200), nullable=False)
    avatar_url: Mapped[str | None] = mapped_column(String(2048), nullable=True)
    role: Mapped[UserRole] = mapped_column(Enum(UserRole), default=UserRole.user, nullable=False)
    is_active: Mapped[bool] = mapped_column(Boolean, default=True, nullable=False)
    is_verified: Mapped[bool] = mapped_column(Boolean, default=False, nullable=False)
    verification_token: Mapped[str | None] = mapped_column(String(128), nullable=True)
    external_id: Mapped[str | None] = mapped_column(String(128), nullable=True)
    crm_synced: Mapped[bool] = mapped_column(Boolean, default=False, nullable=False)
    oauth_provider: Mapped[str | None] = mapped_column(String(32), nullable=True)
    oauth_sub: Mapped[str | None] = mapped_column(String(128), nullable=True)
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), default=lambda: datetime.now(tz=None))
    updated_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True), default=lambda: datetime.now(tz=None), onupdate=lambda: datetime.now(tz=None)
    )

    habits: Mapped[list["Habit"]] = relationship("Habit", back_populates="user", cascade="all, delete-orphan")
    notification_settings: Mapped["NotificationSettings | None"] = relationship(
        "NotificationSettings", back_populates="user", uselist=False, cascade="all, delete-orphan"
    )
    subscription: Mapped["UserSubscription | None"] = relationship(
        "UserSubscription", back_populates="user", uselist=False, cascade="all, delete-orphan"
    )


class Habit(Base):
    __tablename__ = "habits"

    id: Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id: Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="CASCADE"), index=True)
    title: Mapped[str] = mapped_column(String(500), nullable=False)
    main_goal: Mapped[str] = mapped_column(Text, nullable=False)
    micro_step: Mapped[str | None] = mapped_column(Text, nullable=True)
    reminder_time: Mapped[time | None] = mapped_column(Time, nullable=True)
    adaptive_reminder: Mapped[bool] = mapped_column(Boolean, default=False, nullable=False)
    recurrence_rule: Mapped[dict] = mapped_column(JSONB, nullable=False, default=lambda: {"type": "daily"})
    deadline_type: Mapped[DeadlineType | None] = mapped_column(Enum(DeadlineType), nullable=True)
    deadline_value: Mapped[str | None] = mapped_column(String(100), nullable=True)
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), default=lambda: datetime.now(tz=None))
    updated_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True), default=lambda: datetime.now(tz=None), onupdate=lambda: datetime.now(tz=None)
    )

    user: Mapped["User"] = relationship("User", back_populates="habits")
    logs: Mapped[list["HabitLog"]] = relationship("HabitLog", back_populates="habit", cascade="all, delete-orphan")


class HabitLog(Base):
    __tablename__ = "habit_logs"
    __table_args__ = (UniqueConstraint("habit_id", "date", name="uq_habit_log_date"),)

    id: Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    habit_id: Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), ForeignKey("habits.id", ondelete="CASCADE"), index=True)
    log_date: Mapped[date] = mapped_column("date", Date, nullable=False, index=True)
    status: Mapped[HabitLogStatus] = mapped_column(Enum(HabitLogStatus), nullable=False)
    notes: Mapped[str | None] = mapped_column(Text, nullable=True)
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), default=lambda: datetime.now(tz=None))

    habit: Mapped["Habit"] = relationship("Habit", back_populates="logs")


class Message(Base):
    __tablename__ = "messages"

    id: Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    text: Mapped[str] = mapped_column(Text, nullable=False)
    category: Mapped[str] = mapped_column(String(100), nullable=False)
    tone: Mapped[str] = mapped_column(String(50), nullable=False)
    trigger_condition: Mapped[dict | None] = mapped_column(JSONB, nullable=True)
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), default=lambda: datetime.now(tz=None))


class NotificationSettings(Base):
    __tablename__ = "notification_settings"

    user_id: Mapped[uuid.UUID] = mapped_column(
        UUID(as_uuid=True), ForeignKey("users.id", ondelete="CASCADE"), primary_key=True
    )
    global_enabled: Mapped[bool] = mapped_column(Boolean, default=True, nullable=False)
    quiet_hours_start: Mapped[time | None] = mapped_column(Time, nullable=True)
    quiet_hours_end: Mapped[time | None] = mapped_column(Time, nullable=True)
    reminder_tone: Mapped[ReminderTone] = mapped_column(Enum(ReminderTone), default=ReminderTone.neutral, nullable=False)
    micro_step_frequency: Mapped[str | None] = mapped_column(String(50), nullable=True)
    user_timezone: Mapped[str] = mapped_column(String(64), default="Asia/Krasnoyarsk", nullable=False)

    user: Mapped["User"] = relationship("User", back_populates="notification_settings")


class Notification(Base):
    __tablename__ = "notifications"
    __table_args__ = (UniqueConstraint("habit_id", name="uq_notifications_habit_id"),)

    id: Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id: Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="CASCADE"), index=True)
    habit_id: Mapped[uuid.UUID | None] = mapped_column(
        UUID(as_uuid=True), ForeignKey("habits.id", ondelete="CASCADE"), nullable=True, index=True
    )
    goal_datetime: Mapped[datetime] = mapped_column(DateTime(timezone=True), nullable=False, index=True)
    payload: Mapped[dict] = mapped_column(JSONB, nullable=False, default=dict)
    recurrence_rule: Mapped[dict] = mapped_column(JSONB, nullable=False, default=lambda: {"type": "daily"})
    is_active: Mapped[bool] = mapped_column(Boolean, default=True, nullable=False, index=True)
    last_check_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True), default=lambda: datetime.now(timezone.utc), nullable=False
    )
    is_processing: Mapped[bool] = mapped_column(Boolean, default=False, nullable=False, index=True)
    user_timezone: Mapped[str] = mapped_column(String(64), default="UTC", nullable=False)


class NotificationLog(Base):
    __tablename__ = "notification_logs"

    id: Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    notification_id: Mapped[uuid.UUID] = mapped_column(
        UUID(as_uuid=True), ForeignKey("notifications.id", ondelete="CASCADE"), index=True
    )
    sent_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), default=lambda: datetime.now(timezone.utc), nullable=False)
    is_sent: Mapped[bool] = mapped_column(Boolean, default=True, nullable=False)
    payload: Mapped[dict] = mapped_column(JSONB, nullable=False, default=dict)
    error: Mapped[str | None] = mapped_column(Text, nullable=True)


class UserSubscription(Base):
    __tablename__ = "user_subscriptions"

    user_id: Mapped[uuid.UUID] = mapped_column(
        UUID(as_uuid=True), ForeignKey("users.id", ondelete="CASCADE"), primary_key=True
    )
    plan: Mapped[SubscriptionPlan] = mapped_column(Enum(SubscriptionPlan), default=SubscriptionPlan.free, nullable=False)
    start_date: Mapped[date] = mapped_column(Date, nullable=False)
    end_date: Mapped[date | None] = mapped_column(Date, nullable=True)
    auto_renew: Mapped[bool] = mapped_column(Boolean, default=False, nullable=False)

    user: Mapped["User"] = relationship("User", back_populates="subscription")
