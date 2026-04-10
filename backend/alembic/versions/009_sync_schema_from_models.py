"""Full idempotent sync: create missing tables from models + add missing columns, indexes, unique constraints.

Revision ID: 009_models_sync
Revises: 008_schema_sync

Runs after hand-written 008. Keeps DB aligned with SQLAlchemy models when new fields/tables appear.
Downgrade is intentionally a no-op.
"""

from __future__ import annotations

from typing import Sequence, Union

import sqlalchemy as sa
from alembic import op
from sqlalchemy.dialects import postgresql
from sqlalchemy.schema import Index, UniqueConstraint

revision: str = "009_models_sync"
down_revision: Union[str, None] = "008_schema_sync"
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def _ensure_enum_type(column_type: sa.types.TypeEngine, bind) -> None:
    if isinstance(column_type, sa.Enum):
        column_type.create(bind, checkfirst=True)


def _deduce_server_default(column: sa.Column, typ: sa.types.TypeEngine) -> sa.schema.DefaultClause | None:
    if isinstance(typ, sa.Boolean):
        d = column.default
        if d is not None and getattr(d, "arg", None) is True:
            return sa.text("true")
        return sa.text("false")
    if isinstance(typ, sa.DateTime):
        return sa.text("now()")
    if isinstance(typ, sa.Date):
        return sa.text("CURRENT_DATE")
    if isinstance(typ, postgresql.JSONB):
        if column.name == "recurrence_rule":
            return sa.text('\'{"type": "daily"}\'::jsonb')
        return sa.text("'{}'::jsonb")
    if isinstance(typ, (sa.String, sa.Text)):
        return sa.text("''")
    if isinstance(typ, sa.Enum):
        d = column.default
        if d is not None:
            arg = getattr(d, "arg", None)
            if arg is not None:
                if hasattr(arg, "value"):
                    ev = arg.value
                elif isinstance(arg, str):
                    ev = arg
                else:
                    ev = str(arg)
                ename = typ.name or "enum"
                return sa.text(f"'{ev}'::{ename}")
        first = typ.enums[0] if typ.enums else "user"
        ename = typ.name or "enum"
        return sa.text(f"'{first}'::{ename}")
    if isinstance(typ, postgresql.UUID):
        return sa.text("gen_random_uuid()")
    if isinstance(typ, sa.Time):
        return sa.text("TIME '00:00:00'")
    return None


def _column_for_add(table: sa.Table, column: sa.Column, bind) -> sa.Column:
    typ = column.type.copy() if hasattr(column.type, "copy") else column.type
    _ensure_enum_type(typ, bind)

    nullable = column.nullable
    server_default = column.server_default
    if not nullable and server_default is None:
        server_default = _deduce_server_default(column, typ)
        if server_default is None:
            nullable = True

    fk_list = []
    for fk in column.foreign_keys:
        spec = fk.target_fullname
        fk_list.append(
            sa.ForeignKey(
                spec,
                ondelete=fk.ondelete,
                onupdate=fk.onupdate,
                name=fk.name,
            )
        )

    return sa.Column(
        column.name,
        typ,
        *fk_list,
        nullable=nullable,
        server_default=server_default,
    )


def _index_names(inspector: sa.Inspector, table: str) -> set[str]:
    return {idx["name"] for idx in inspector.get_indexes(table)}


def _uq_names(inspector: sa.Inspector, table: str) -> set[str]:
    return {u["name"] for u in inspector.get_unique_constraints(table)}


def upgrade() -> None:
    bind = op.get_bind()

    from app.database import Base  # noqa: PLC0415
    import app.models  # noqa: F401, PLC0415

    Base.metadata.create_all(bind=bind)

    inspector = sa.inspect(bind)
    table_names = inspector.get_table_names()

    for table in Base.metadata.sorted_tables:
        if table.name not in table_names:
            continue
        existing_cols = {c["name"] for c in inspector.get_columns(table.name)}
        for column in table.columns:
            if column.name in existing_cols:
                continue
            _ensure_enum_type(column.type, bind)
            op.add_column(table.name, _column_for_add(table, column, bind))
            existing_cols.add(column.name)

    inspector = sa.inspect(bind)

    for table in Base.metadata.sorted_tables:
        if table.name not in inspector.get_table_names():
            continue
        existing_idx = _index_names(inspector, table.name)
        for idx in table.indexes:
            if not isinstance(idx, Index):
                continue
            if idx.name in existing_idx:
                continue
            cols = [c.name for c in idx.columns]
            if not cols:
                continue
            op.create_index(idx.name, table.name, cols, unique=idx.unique)
            existing_idx.add(idx.name)

        existing_uq = _uq_names(inspector, table.name)
        for con in table.constraints:
            if not isinstance(con, UniqueConstraint):
                continue
            if con.name in existing_uq:
                continue
            col_names = [c.name for c in con.columns]
            if col_names:
                op.create_unique_constraint(con.name, table.name, col_names)
                existing_uq.add(con.name)

    # Known column-level fixes (models expect nullable password for OAuth)
    if "users" in inspector.get_table_names():
        cols = {c["name"]: c for c in inspector.get_columns("users")}
        if "password_hash" in cols and not cols["password_hash"]["nullable"]:
            op.alter_column("users", "password_hash", existing_type=sa.String(length=255), nullable=True)


def downgrade() -> None:
    pass
