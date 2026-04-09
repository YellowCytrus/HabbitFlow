"""notifications mvp schema

Revision ID: 004_notifications_mvp
Revises: 003_pending_registration
Create Date: 2026-04-07
"""

from typing import Sequence, Union

import sqlalchemy as sa
from alembic import op
from sqlalchemy.dialects import postgresql

revision: str = "004_notifications_mvp"
down_revision: Union[str, None] = "003_pending_reg"
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    op.add_column(
        "notification_settings",
        sa.Column("user_timezone", sa.String(length=64), nullable=False, server_default="UTC"),
    )
    op.create_table(
        "notifications",
        sa.Column("id", postgresql.UUID(as_uuid=True), nullable=False),
        sa.Column("user_id", postgresql.UUID(as_uuid=True), nullable=False),
        sa.Column("habit_id", postgresql.UUID(as_uuid=True), nullable=True),
        sa.Column("goal_datetime", sa.DateTime(timezone=True), nullable=False),
        sa.Column("payload", postgresql.JSONB(astext_type=sa.Text()), nullable=False),
        sa.Column("recurrence_rule", postgresql.JSONB(astext_type=sa.Text()), nullable=False),
        sa.Column("is_active", sa.Boolean(), nullable=False),
        sa.Column("last_check_at", sa.DateTime(timezone=True), nullable=False),
        sa.Column("is_processing", sa.Boolean(), nullable=False),
        sa.Column("user_timezone", sa.String(length=64), nullable=False),
        sa.ForeignKeyConstraint(["habit_id"], ["habits.id"], ondelete="CASCADE"),
        sa.ForeignKeyConstraint(["user_id"], ["users.id"], ondelete="CASCADE"),
        sa.PrimaryKeyConstraint("id"),
        sa.UniqueConstraint("habit_id", name="uq_notifications_habit_id"),
    )
    op.create_index(op.f("ix_notifications_user_id"), "notifications", ["user_id"], unique=False)
    op.create_index(op.f("ix_notifications_habit_id"), "notifications", ["habit_id"], unique=False)
    op.create_index(op.f("ix_notifications_goal_datetime"), "notifications", ["goal_datetime"], unique=False)
    op.create_index(op.f("ix_notifications_is_active"), "notifications", ["is_active"], unique=False)
    op.create_index(op.f("ix_notifications_is_processing"), "notifications", ["is_processing"], unique=False)

    op.create_table(
        "notification_logs",
        sa.Column("id", postgresql.UUID(as_uuid=True), nullable=False),
        sa.Column("notification_id", postgresql.UUID(as_uuid=True), nullable=False),
        sa.Column("sent_at", sa.DateTime(timezone=True), nullable=False),
        sa.Column("is_sent", sa.Boolean(), nullable=False),
        sa.Column("payload", postgresql.JSONB(astext_type=sa.Text()), nullable=False),
        sa.Column("error", sa.Text(), nullable=True),
        sa.ForeignKeyConstraint(["notification_id"], ["notifications.id"], ondelete="CASCADE"),
        sa.PrimaryKeyConstraint("id"),
    )
    op.create_index(op.f("ix_notification_logs_notification_id"), "notification_logs", ["notification_id"], unique=False)


def downgrade() -> None:
    op.drop_index(op.f("ix_notification_logs_notification_id"), table_name="notification_logs")
    op.drop_table("notification_logs")
    op.drop_index(op.f("ix_notifications_is_processing"), table_name="notifications")
    op.drop_index(op.f("ix_notifications_is_active"), table_name="notifications")
    op.drop_index(op.f("ix_notifications_goal_datetime"), table_name="notifications")
    op.drop_index(op.f("ix_notifications_habit_id"), table_name="notifications")
    op.drop_index(op.f("ix_notifications_user_id"), table_name="notifications")
    op.drop_table("notifications")
    op.drop_column("notification_settings", "user_timezone")
