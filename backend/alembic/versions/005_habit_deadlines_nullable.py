"""make habit deadlines nullable

Revision ID: 005_habit_deadlines_nullable
Revises: 004_notifications_mvp
Create Date: 2026-04-09
"""

from typing import Sequence, Union

import sqlalchemy as sa
from alembic import op

revision: str = "005_habit_deadlines_nullable"
down_revision: Union[str, None] = "004_notifications_mvp"
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    op.alter_column("habits", "deadline_type", existing_type=sa.Enum("exact", "slot", name="deadlinetype"), nullable=True)
    op.alter_column("habits", "deadline_value", existing_type=sa.String(length=100), nullable=True)


def downgrade() -> None:
    op.execute("UPDATE habits SET deadline_type = 'slot' WHERE deadline_type IS NULL")
    op.execute("UPDATE habits SET deadline_value = 'morning' WHERE deadline_value IS NULL")
    op.alter_column("habits", "deadline_type", existing_type=sa.Enum("exact", "slot", name="deadlinetype"), nullable=False)
    op.alter_column("habits", "deadline_value", existing_type=sa.String(length=100), nullable=False)
