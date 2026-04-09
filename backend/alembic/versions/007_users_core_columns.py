"""users: role, flags, tokens, timestamps (legacy DBs missing create_all columns)

Revision ID: 007_users_core
Revises: 006_user_avatar_oauth
Create Date: 2026-04-09
"""

from typing import Sequence, Union

import sqlalchemy as sa
from alembic import op
from sqlalchemy.dialects import postgresql

revision: str = "007_users_core"
down_revision: Union[str, None] = "006_user_avatar_oauth"
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    bind = op.get_bind()
    inspector = sa.inspect(bind)
    if "users" not in inspector.get_table_names():
        return

    user_columns = {c["name"] for c in inspector.get_columns("users")}

    if "role" not in user_columns:
        op.execute(
            sa.text(
                """
                DO $$ BEGIN
                    CREATE TYPE userrole AS ENUM ('user', 'admin');
                EXCEPTION
                    WHEN duplicate_object THEN NULL;
                END $$;
                """
            )
        )
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

    if "is_active" not in user_columns:
        op.add_column(
            "users",
            sa.Column("is_active", sa.Boolean(), nullable=False, server_default=sa.text("true")),
        )

    if "is_verified" not in user_columns:
        op.add_column(
            "users",
            sa.Column("is_verified", sa.Boolean(), nullable=False, server_default=sa.text("false")),
        )

    if "verification_token" not in user_columns:
        op.add_column("users", sa.Column("verification_token", sa.String(length=128), nullable=True))

    if "external_id" not in user_columns:
        op.add_column("users", sa.Column("external_id", sa.String(length=128), nullable=True))

    if "crm_synced" not in user_columns:
        op.add_column(
            "users",
            sa.Column("crm_synced", sa.Boolean(), nullable=False, server_default=sa.text("false")),
        )

    if "created_at" not in user_columns:
        op.add_column(
            "users",
            sa.Column(
                "created_at",
                sa.DateTime(timezone=True),
                nullable=False,
                server_default=sa.text("now()"),
            ),
        )

    if "updated_at" not in user_columns:
        op.add_column(
            "users",
            sa.Column(
                "updated_at",
                sa.DateTime(timezone=True),
                nullable=False,
                server_default=sa.text("now()"),
            ),
        )


def downgrade() -> None:
    bind = op.get_bind()
    inspector = sa.inspect(bind)
    if "users" not in inspector.get_table_names():
        return

    user_columns = {c["name"] for c in inspector.get_columns("users")}

    for col in ("updated_at", "created_at", "crm_synced", "external_id", "verification_token", "is_verified", "is_active", "role"):
        if col in user_columns:
            op.drop_column("users", col)

    postgresql.ENUM("user", "admin", name="userrole", create_type=False).drop(bind, checkfirst=True)
