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
    bind = op.get_bind()
    inspector = sa.inspect(bind)

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

    existing_indexes = {idx["name"] for idx in inspector.get_indexes("pending_registrations")}
    index_name = op.f("ix_pending_registrations_email")
    if index_name not in existing_indexes:
        op.create_index(index_name, "pending_registrations", ["email"], unique=True)

    user_columns = {col["name"] for col in inspector.get_columns("users")}
    if "verification_code_expires_at" in user_columns:
        op.drop_column("users", "verification_code_expires_at")
    if "verification_code_hash" in user_columns:
        op.drop_column("users", "verification_code_hash")


def downgrade() -> None:
    op.add_column("users", sa.Column("verification_code_hash", sa.String(length=255), nullable=True))
    op.add_column("users", sa.Column("verification_code_expires_at", sa.DateTime(timezone=True), nullable=True))
    op.drop_index(op.f("ix_pending_registrations_email"), table_name="pending_registrations")
    op.drop_table("pending_registrations")
