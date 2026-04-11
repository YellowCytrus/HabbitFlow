#!/usr/bin/env bash
# Создаёт (или обновляет пароль) пользователя PostgreSQL teacher_readonly — только SELECT.
# Запуск из корня репозитория, контейнер api должен быть запущен (нужен DATABASE_URL).
#
# В .env задай: TEACHER_DB_PASSWORD=...
#
#   chmod +x scripts/create_teacher_readonly.sh
#   ./scripts/create_teacher_readonly.sh
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

if [[ ! -f .env ]]; then
  echo "Нет .env в корне." >&2
  exit 1
fi

set -a
# shellcheck disable=SC1091
source .env
set +a

if [[ -z "${TEACHER_DB_PASSWORD:-}" ]]; then
  echo "Задай в .env переменную TEACHER_DB_PASSWORD (пароль для преподавателя к БД)." >&2
  exit 1
fi

if ! docker compose exec -T api true 2>/dev/null; then
  echo "Контейнер api не запущен. Сначала: docker compose up -d" >&2
  exit 1
fi

docker compose exec -T -e TEACHER_DB_PASSWORD="$TEACHER_DB_PASSWORD" api python - <<'PY'
import os
import urllib.parse

import psycopg2
from psycopg2 import sql

pw = os.environ["TEACHER_DB_PASSWORD"]
url = os.environ.get("DATABASE_URL", "")
parsed = urllib.parse.urlparse(url)
db = (parsed.path or "/habitflow").lstrip("/") or "habitflow"
owner = parsed.username or "habitflow"

conn = psycopg2.connect(url)
conn.autocommit = True
cur = conn.cursor()

cur.execute("SELECT 1 FROM pg_roles WHERE rolname = 'teacher_readonly'")
if cur.fetchone():
    cur.execute(
        sql.SQL("ALTER USER teacher_readonly WITH PASSWORD %s"),
        [pw],
    )
else:
    cur.execute(
        sql.SQL("CREATE USER teacher_readonly WITH PASSWORD %s"),
        [pw],
    )

cur.execute(
    sql.SQL("GRANT CONNECT ON DATABASE {} TO teacher_readonly").format(sql.Identifier(db)),
)
cur.execute("GRANT USAGE ON SCHEMA public TO teacher_readonly")
cur.execute("GRANT SELECT ON ALL TABLES IN SCHEMA public TO teacher_readonly")
cur.execute("GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO teacher_readonly")
cur.execute(
    sql.SQL(
        "ALTER DEFAULT PRIVILEGES FOR ROLE {} IN SCHEMA public "
        "GRANT SELECT ON TABLES TO teacher_readonly"
    ).format(sql.Identifier(owner)),
)
cur.execute(
    sql.SQL(
        "ALTER DEFAULT PRIVILEGES FOR ROLE {} IN SCHEMA public "
        "GRANT SELECT ON SEQUENCES TO teacher_readonly"
    ).format(sql.Identifier(owner)),
)

cur.close()
conn.close()
print("OK: пользователь teacher_readonly готов (только чтение).")
PY
