"""Idempotent full schema sync vs current SQLAlchemy models (legacy / drifted DBs).

Revision ID: 008_schema_sync
Revises: 007_users_core
Create Date: 2026-04-09

Adds missing tables, columns, indexes, and enum types. Safe to re-run.
Downgrade is a no-op — forward-only safety net.
"""

from __future__ import annotations

from typing import Sequence, Union

import sqlalchemy as sa
from alembic import op
from sqlalchemy.dialects import postgresql

revision: str = "008_schema_sync"
down_revision: Union[str, None] = "007_users_core"
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def _ensure_enum(values: tuple[str, ...], name: str) -> None:
    vals = ", ".join(repr(v) for v in values)
    op.execute(
        sa.text(
            f"""
            DO $$ BEGIN
                CREATE TYPE {name} AS ENUM ({vals});
            EXCEPTION
                WHEN duplicate_object THEN NULL;
            END $$;
            """
        )
    )


def _colnames(inspector: sa.Inspector, table: str) -> set[str]:
    return {c["name"] for c in inspector.get_columns(table)}


def _indexes(inspector: sa.Inspector, table: str) -> set[str]:
    return {idx["name"] for idx in inspector.get_indexes(table)}


def _uq_names(inspector: sa.Inspector, table: str) -> set[str]:
    return {u["name"] for u in inspector.get_unique_constraints(table)}


def upgrade() -> None:
    bind = op.get_bind()
    inspector = sa.inspect(bind)

    for name, vals in [
        ("userrole", ("user", "admin")),
        ("deadlinetype", ("exact", "slot")),
        ("habitlogstatus", ("full", "micro", "missed")),
        ("remindertone", ("soft", "neutral")),
        ("subscriptionplan", ("free", "premium")),
    ]:
        _ensure_enum(vals, name)

    # --- pending_registrations ---
    if "pending_registrations" not in inspector.get_table_names():
        op.create_table(
            "pending_registrations",
            sa.Column("id", postgresql.UUID(as_uuid=True), nullable=False),
            sa.Column("email", sa.String(length=320), nullable=False),
            sa.Column("password_hash", sa.String(length=255), nullable=False),
            sa.Column("name", sa.String(length=200), nullable=False),
            sa.Column("verification_code_hash", sa.String(length=255), nullable=False),
            sa.Column("verification_code_expires_at", sa.DateTime(timezone=True), nullable=False),
            sa.Column("created_at", sa.DateTime(timezone=True), nullable=False),
            sa.PrimaryKeyConstraint("id"),
        )
        op.create_index(op.f("ix_pending_registrations_email"), "pending_registrations", ["email"], unique=True)

    # --- users (subset may already exist) ---
    if "users" in inspector.get_table_names():
        uc = _colnames(inspector, "users")
        if "avatar_url" not in uc:
            op.add_column("users", sa.Column("avatar_url", sa.String(length=2048), nullable=True))
        if "oauth_provider" not in uc:
            op.add_column("users", sa.Column("oauth_provider", sa.String(length=32), nullable=True))
        if "oauth_sub" not in uc:
            op.add_column("users", sa.Column("oauth_sub", sa.String(length=128), nullable=True))
        cols = {c["name"]: c for c in inspector.get_columns("users")}
        if "password_hash" in cols and not cols["password_hash"]["nullable"]:
            op.alter_column("users", "password_hash", existing_type=sa.String(length=255), nullable=True)
        if "role" not in uc:
            role_enum = postgresql.ENUM("user", "admin", name="userrole", create_type=False)
            op.add_column(
                "users",
                sa.Column(
                    "role",
                    role_enum,
                    nullable=False,
                    server_default=sa.text("'user'::userrole"),
                ),
            )
        if "is_active" not in uc:
            op.add_column(
                "users",
                sa.Column("is_active", sa.Boolean(), nullable=False, server_default=sa.text("true")),
            )
        if "is_verified" not in uc:
            op.add_column(
                "users",
                sa.Column("is_verified", sa.Boolean(), nullable=False, server_default=sa.text("false")),
            )
        if "verification_token" not in uc:
            op.add_column("users", sa.Column("verification_token", sa.String(length=128), nullable=True))
        if "external_id" not in uc:
            op.add_column("users", sa.Column("external_id", sa.String(length=128), nullable=True))
        if "crm_synced" not in uc:
            op.add_column(
                "users",
                sa.Column("crm_synced", sa.Boolean(), nullable=False, server_default=sa.text("false")),
            )
        if "created_at" not in uc:
            op.add_column(
                "users",
                sa.Column("created_at", sa.DateTime(timezone=True), nullable=False, server_default=sa.text("now()")),
            )
        if "updated_at" not in uc:
            op.add_column(
                "users",
                sa.Column("updated_at", sa.DateTime(timezone=True), nullable=False, server_default=sa.text("now()")),
            )

    # --- habits ---
    if "habits" not in inspector.get_table_names():
        dt = postgresql.ENUM("exact", "slot", name="deadlinetype", create_type=False)
        op.create_table(
            "habits",
            sa.Column("id", postgresql.UUID(as_uuid=True), nullable=False),
            sa.Column("user_id", postgresql.UUID(as_uuid=True), nullable=False),
            sa.Column("title", sa.String(length=500), nullable=False),
            sa.Column("main_goal", sa.Text(), nullable=False),
            sa.Column("micro_step", sa.Text(), nullable=True),
            sa.Column("reminder_time", sa.Time(), nullable=True),
            sa.Column("adaptive_reminder", sa.Boolean(), nullable=False, server_default=sa.text("false")),
            sa.Column(
                "recurrence_rule",
                postgresql.JSONB(astext_type=sa.Text()),
                nullable=False,
                server_default=sa.text('\'{"type": "daily"}\'::jsonb'),
            ),
            sa.Column("deadline_type", dt, nullable=True),
            sa.Column("deadline_value", sa.String(length=100), nullable=True),
            sa.Column("created_at", sa.DateTime(timezone=True), nullable=False, server_default=sa.text("now()")),
            sa.Column("updated_at", sa.DateTime(timezone=True), nullable=False, server_default=sa.text("now()")),
            sa.ForeignKeyConstraint(["user_id"], ["users.id"], ondelete="CASCADE"),
            sa.PrimaryKeyConstraint("id"),
        )
        op.create_index(op.f("ix_habits_user_id"), "habits", ["user_id"], unique=False)
    else:
        hc = _colnames(inspector, "habits")
        if "micro_step" not in hc:
            op.add_column("habits", sa.Column("micro_step", sa.Text(), nullable=True))
        if "reminder_time" not in hc:
            op.add_column("habits", sa.Column("reminder_time", sa.Time(), nullable=True))
        if "adaptive_reminder" not in hc:
            op.add_column(
                "habits",
                sa.Column("adaptive_reminder", sa.Boolean(), nullable=False, server_default=sa.text("false")),
            )
        if "recurrence_rule" not in hc:
            op.add_column(
                "habits",
                sa.Column(
                    "recurrence_rule",
                    postgresql.JSONB(astext_type=sa.Text()),
                    nullable=False,
                    server_default=sa.text('\'{"type": "daily"}\'::jsonb'),
                ),
            )
        if "deadline_type" not in hc:
            dt = postgresql.ENUM("exact", "slot", name="deadlinetype", create_type=False)
            op.add_column("habits", sa.Column("deadline_type", dt, nullable=True))
        if "deadline_value" not in hc:
            op.add_column("habits", sa.Column("deadline_value", sa.String(length=100), nullable=True))
        if "main_goal" not in hc:
            op.add_column("habits", sa.Column("main_goal", sa.Text(), nullable=False, server_default=""))
        if "created_at" not in hc:
            op.add_column(
                "habits",
                sa.Column("created_at", sa.DateTime(timezone=True), nullable=False, server_default=sa.text("now()")),
            )
        if "updated_at" not in hc:
            op.add_column(
                "habits",
                sa.Column("updated_at", sa.DateTime(timezone=True), nullable=False, server_default=sa.text("now()")),
            )
        hi = _indexes(inspector, "habits")
        if op.f("ix_habits_user_id") not in hi:
            op.create_index(op.f("ix_habits_user_id"), "habits", ["user_id"], unique=False)

    # --- habit_logs ---
    if "habit_logs" not in inspector.get_table_names():
        st = postgresql.ENUM("full", "micro", "missed", name="habitlogstatus", create_type=False)
        op.create_table(
            "habit_logs",
            sa.Column("id", postgresql.UUID(as_uuid=True), nullable=False),
            sa.Column("habit_id", postgresql.UUID(as_uuid=True), nullable=False),
            sa.Column("date", sa.Date(), nullable=False),
            sa.Column("status", st, nullable=False),
            sa.Column("notes", sa.Text(), nullable=True),
            sa.Column("created_at", sa.DateTime(timezone=True), nullable=False, server_default=sa.text("now()")),
            sa.ForeignKeyConstraint(["habit_id"], ["habits.id"], ondelete="CASCADE"),
            sa.PrimaryKeyConstraint("id"),
            sa.UniqueConstraint("habit_id", "date", name="uq_habit_log_date"),
        )
        op.create_index(op.f("ix_habit_logs_habit_id"), "habit_logs", ["habit_id"], unique=False)
        op.create_index(op.f("ix_habit_logs_date"), "habit_logs", ["date"], unique=False)
    else:
        lc = _colnames(inspector, "habit_logs")
        if "notes" not in lc:
            op.add_column("habit_logs", sa.Column("notes", sa.Text(), nullable=True))
        if "created_at" not in lc:
            op.add_column(
                "habit_logs",
                sa.Column("created_at", sa.DateTime(timezone=True), nullable=False, server_default=sa.text("now()")),
            )
        if "status" not in lc:
            st = postgresql.ENUM("full", "micro", "missed", name="habitlogstatus", create_type=False)
            op.add_column(
                "habit_logs",
                sa.Column("status", st, nullable=False, server_default=sa.text("'full'::habitlogstatus")),
            )
        li = _indexes(inspector, "habit_logs")
        for name, cols in [
            (op.f("ix_habit_logs_habit_id"), ["habit_id"]),
            (op.f("ix_habit_logs_date"), ["date"]),
        ]:
            if name not in li:
                op.create_index(name, "habit_logs", cols, unique=False)
        if "uq_habit_log_date" not in _uq_names(inspector, "habit_logs"):
            op.create_unique_constraint("uq_habit_log_date", "habit_logs", ["habit_id", "date"])

    # --- messages ---
    if "messages" not in inspector.get_table_names():
        op.create_table(
            "messages",
            sa.Column("id", postgresql.UUID(as_uuid=True), nullable=False),
            sa.Column("text", sa.Text(), nullable=False),
            sa.Column("category", sa.String(length=100), nullable=False),
            sa.Column("tone", sa.String(length=50), nullable=False),
            sa.Column("trigger_condition", postgresql.JSONB(astext_type=sa.Text()), nullable=True),
            sa.Column("created_at", sa.DateTime(timezone=True), nullable=False, server_default=sa.text("now()")),
            sa.PrimaryKeyConstraint("id"),
        )

    # --- notification_settings ---
    if "notification_settings" not in inspector.get_table_names():
        rt = postgresql.ENUM("soft", "neutral", name="remindertone", create_type=False)
        op.create_table(
            "notification_settings",
            sa.Column("user_id", postgresql.UUID(as_uuid=True), nullable=False),
            sa.Column("global_enabled", sa.Boolean(), nullable=False, server_default=sa.text("true")),
            sa.Column("quiet_hours_start", sa.Time(), nullable=True),
            sa.Column("quiet_hours_end", sa.Time(), nullable=True),
            sa.Column(
                "reminder_tone",
                rt,
                nullable=False,
                server_default=sa.text("'neutral'::remindertone"),
            ),
            sa.Column("micro_step_frequency", sa.String(length=50), nullable=True),
            sa.Column("user_timezone", sa.String(length=64), nullable=False, server_default="UTC"),
            sa.ForeignKeyConstraint(["user_id"], ["users.id"], ondelete="CASCADE"),
            sa.PrimaryKeyConstraint("user_id"),
        )
    else:
        nc = _colnames(inspector, "notification_settings")
        if "user_timezone" not in nc:
            op.add_column(
                "notification_settings",
                sa.Column("user_timezone", sa.String(length=64), nullable=False, server_default="UTC"),
            )
        if "quiet_hours_start" not in nc:
            op.add_column("notification_settings", sa.Column("quiet_hours_start", sa.Time(), nullable=True))
        if "quiet_hours_end" not in nc:
            op.add_column("notification_settings", sa.Column("quiet_hours_end", sa.Time(), nullable=True))
        if "reminder_tone" not in nc:
            rt = postgresql.ENUM("soft", "neutral", name="remindertone", create_type=False)
            op.add_column(
                "notification_settings",
                sa.Column(
                    "reminder_tone",
                    rt,
                    nullable=False,
                    server_default=sa.text("'neutral'::remindertone"),
                ),
            )
        if "micro_step_frequency" not in nc:
            op.add_column("notification_settings", sa.Column("micro_step_frequency", sa.String(length=50), nullable=True))
        if "global_enabled" not in nc:
            op.add_column(
                "notification_settings",
                sa.Column("global_enabled", sa.Boolean(), nullable=False, server_default=sa.text("true")),
            )

    # --- notifications ---
    if "notifications" not in inspector.get_table_names():
        op.create_table(
            "notifications",
            sa.Column("id", postgresql.UUID(as_uuid=True), nullable=False),
            sa.Column("user_id", postgresql.UUID(as_uuid=True), nullable=False),
            sa.Column("habit_id", postgresql.UUID(as_uuid=True), nullable=True),
            sa.Column("goal_datetime", sa.DateTime(timezone=True), nullable=False),
            sa.Column("payload", postgresql.JSONB(astext_type=sa.Text()), nullable=False, server_default=sa.text("'{}'::jsonb")),
            sa.Column(
                "recurrence_rule",
                postgresql.JSONB(astext_type=sa.Text()),
                nullable=False,
                server_default=sa.text('\'{"type": "daily"}\'::jsonb'),
            ),
            sa.Column("is_active", sa.Boolean(), nullable=False, server_default=sa.text("true")),
            sa.Column("last_check_at", sa.DateTime(timezone=True), nullable=False, server_default=sa.text("now()")),
            sa.Column("is_processing", sa.Boolean(), nullable=False, server_default=sa.text("false")),
            sa.Column("user_timezone", sa.String(length=64), nullable=False, server_default="UTC"),
            sa.ForeignKeyConstraint(["habit_id"], ["habits.id"], ondelete="CASCADE"),
            sa.ForeignKeyConstraint(["user_id"], ["users.id"], ondelete="CASCADE"),
            sa.PrimaryKeyConstraint("id"),
            sa.UniqueConstraint("habit_id", name="uq_notifications_habit_id"),
        )
        for name, cols in [
            (op.f("ix_notifications_user_id"), ["user_id"]),
            (op.f("ix_notifications_habit_id"), ["habit_id"]),
            (op.f("ix_notifications_goal_datetime"), ["goal_datetime"]),
            (op.f("ix_notifications_is_active"), ["is_active"]),
            (op.f("ix_notifications_is_processing"), ["is_processing"]),
        ]:
            op.create_index(name, "notifications", cols, unique=False)
    else:
        ncols = _colnames(inspector, "notifications")
        if "user_timezone" not in ncols:
            op.add_column(
                "notifications",
                sa.Column("user_timezone", sa.String(length=64), nullable=False, server_default="UTC"),
            )
        ni = _indexes(inspector, "notifications")
        for name, cols in [
            (op.f("ix_notifications_user_id"), ["user_id"]),
            (op.f("ix_notifications_habit_id"), ["habit_id"]),
            (op.f("ix_notifications_goal_datetime"), ["goal_datetime"]),
            (op.f("ix_notifications_is_active"), ["is_active"]),
            (op.f("ix_notifications_is_processing"), ["is_processing"]),
        ]:
            if name not in ni:
                op.create_index(name, "notifications", cols, unique=False)
        if "uq_notifications_habit_id" not in _uq_names(inspector, "notifications"):
            op.create_unique_constraint("uq_notifications_habit_id", "notifications", ["habit_id"])

    # --- notification_logs ---
    if "notification_logs" not in inspector.get_table_names():
        op.create_table(
            "notification_logs",
            sa.Column("id", postgresql.UUID(as_uuid=True), nullable=False),
            sa.Column("notification_id", postgresql.UUID(as_uuid=True), nullable=False),
            sa.Column("sent_at", sa.DateTime(timezone=True), nullable=False, server_default=sa.text("now()")),
            sa.Column("is_sent", sa.Boolean(), nullable=False, server_default=sa.text("true")),
            sa.Column("payload", postgresql.JSONB(astext_type=sa.Text()), nullable=False, server_default=sa.text("'{}'::jsonb")),
            sa.Column("error", sa.Text(), nullable=True),
            sa.ForeignKeyConstraint(["notification_id"], ["notifications.id"], ondelete="CASCADE"),
            sa.PrimaryKeyConstraint("id"),
        )
        op.create_index(
            op.f("ix_notification_logs_notification_id"),
            "notification_logs",
            ["notification_id"],
            unique=False,
        )

    # --- user_subscriptions ---
    if "user_subscriptions" not in inspector.get_table_names():
        sp = postgresql.ENUM("free", "premium", name="subscriptionplan", create_type=False)
        op.create_table(
            "user_subscriptions",
            sa.Column("user_id", postgresql.UUID(as_uuid=True), nullable=False),
            sa.Column(
                "plan",
                sp,
                nullable=False,
                server_default=sa.text("'free'::subscriptionplan"),
            ),
            sa.Column("start_date", sa.Date(), nullable=False),
            sa.Column("end_date", sa.Date(), nullable=True),
            sa.Column("auto_renew", sa.Boolean(), nullable=False, server_default=sa.text("false")),
            sa.ForeignKeyConstraint(["user_id"], ["users.id"], ondelete="CASCADE"),
            sa.PrimaryKeyConstraint("user_id"),
        )


def downgrade() -> None:
    pass
