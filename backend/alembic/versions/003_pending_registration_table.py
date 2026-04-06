"""pending_registrations; drop user verification code columns

Revision ID: 003_pending_reg
Revises: 002_reg_code
Create Date: 2026-04-06

"""

from typing import Sequence, Union

import sqlalchemy as sa
from alembic import op
from sqlalchemy.dialects import postgresql

revision: str = "003_pending_reg"
down_revision: Union[str, None] = "002_reg_code"
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
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
    op.drop_column("users", "verification_code_expires_at")
    op.drop_column("users", "verification_code_hash")


def downgrade() -> None:
    op.add_column("users", sa.Column("verification_code_hash", sa.String(length=255), nullable=True))
    op.add_column("users", sa.Column("verification_code_expires_at", sa.DateTime(timezone=True), nullable=True))
    op.drop_index(op.f("ix_pending_registrations_email"), table_name="pending_registrations")
    op.drop_table("pending_registrations")
