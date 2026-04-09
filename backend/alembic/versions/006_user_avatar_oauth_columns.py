"""user avatar_url and oauth columns (were missing from incremental migrations)

Revision ID: 006_user_avatar_oauth
Revises: 005_habit_deadlines_nullable
Create Date: 2026-04-09
"""

from typing import Sequence, Union

import sqlalchemy as sa
from alembic import op

revision: str = "006_user_avatar_oauth"
down_revision: Union[str, None] = "005_habit_deadlines_nullable"
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    bind = op.get_bind()
    inspector = sa.inspect(bind)
    user_columns = {col["name"] for col in inspector.get_columns("users")}

    if "avatar_url" not in user_columns:
        op.add_column("users", sa.Column("avatar_url", sa.String(length=2048), nullable=True))
    if "oauth_provider" not in user_columns:
        op.add_column("users", sa.Column("oauth_provider", sa.String(length=32), nullable=True))
    if "oauth_sub" not in user_columns:
        op.add_column("users", sa.Column("oauth_sub", sa.String(length=128), nullable=True))

    # OAuth users have no password; older DBs may have NOT NULL on password_hash
    cols = {c["name"]: c for c in inspector.get_columns("users")}
    if "password_hash" in cols and not cols["password_hash"]["nullable"]:
        op.alter_column("users", "password_hash", existing_type=sa.String(length=255), nullable=True)


def downgrade() -> None:
    bind = op.get_bind()
    inspector = sa.inspect(bind)
    user_columns = {col["name"] for col in inspector.get_columns("users")}

    if "oauth_sub" in user_columns:
        op.drop_column("users", "oauth_sub")
    if "oauth_provider" in user_columns:
        op.drop_column("users", "oauth_provider")
    if "avatar_url" in user_columns:
        op.drop_column("users", "avatar_url")

    # Do not force password_hash back to NOT NULL — may violate existing rows
