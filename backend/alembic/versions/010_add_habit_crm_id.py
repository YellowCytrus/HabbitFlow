"""Add crm_id column to habits table.

Revision ID: 010_add_habit_crm_id
Revises: 009_models_sync
"""

from __future__ import annotations

from typing import Sequence, Union

import sqlalchemy as sa
from alembic import op

revision: str = "010_add_habit_crm_id"
down_revision: Union[str, None] = "009_models_sync"
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    bind = op.get_bind()
    inspector = sa.inspect(bind)
    if "habits" not in inspector.get_table_names():
        return
    cols = {c["name"] for c in inspector.get_columns("habits")}
    if "crm_id" not in cols:
        op.add_column("habits", sa.Column("crm_id", sa.String(length=128), nullable=True))


def downgrade() -> None:
    bind = op.get_bind()
    inspector = sa.inspect(bind)
    if "habits" not in inspector.get_table_names():
        return
    cols = {c["name"] for c in inspector.get_columns("habits")}
    if "crm_id" in cols:
        op.drop_column("habits", "crm_id")
