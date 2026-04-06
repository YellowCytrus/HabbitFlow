#!/usr/bin/env bash
set -euo pipefail

# Run backend tests (pytest). Integration tests need PostgreSQL (database habitflow_test).
# Usage:
#   ./run_tests.sh
#   ./run_tests.sh -v
#   ./run_tests.sh -rs                    # show skip reasons (e.g. DB unreachable)
#   ./run_tests.sh backend/tests/test_api_security.py -q
#   TEST_DATABASE_URL=postgresql://user:pass@host:5432/habitflow_test ./run_tests.sh
#
# If TEST_DATABASE_URL is not set, the script tries in order:
#   1) DATABASE_URL from .env with database name replaced by habitflow_test
#   2) host port from `docker compose port db 5432` (when compose project is in this repo)
#   3) postgresql://habitflow:habitflow@127.0.0.1:5432/habitflow_test

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

if ! command -v uv >/dev/null 2>&1; then
  echo "uv is required (https://docs.astral.sh/uv/)." >&2
  exit 1
fi

uv sync --extra dev

if [[ -f .env ]]; then
  set -a
  # shellcheck disable=SC1091
  source .env
  set +a
fi

TEST_DB_URL_SET_BY_USER=0
if [[ -n "${TEST_DATABASE_URL:-}" ]]; then
  TEST_DB_URL_SET_BY_USER=1
fi

if [[ -z "${TEST_DATABASE_URL:-}" && -n "${DATABASE_URL:-}" ]]; then
  TEST_DATABASE_URL="$(uv run python -c "
from sqlalchemy.engine import make_url
import os
u = make_url(os.environ['DATABASE_URL'])
print(u.set(database='habitflow_test'))
")"
fi

if [[ -z "${TEST_DATABASE_URL:-}" && -f "$ROOT/docker-compose.yml" ]] && command -v docker >/dev/null 2>&1; then
  if host_port="$(cd "$ROOT" && docker compose port db 5432 2>/dev/null | awk -F: '{print $NF}')"; then
    if [[ -n "$host_port" ]]; then
      TEST_DATABASE_URL="postgresql://habitflow:habitflow@127.0.0.1:${host_port}/habitflow_test"
    fi
  fi
fi

export TEST_DATABASE_URL="${TEST_DATABASE_URL:-postgresql://habitflow:habitflow@127.0.0.1:5432/habitflow_test}"

if [[ "$TEST_DB_URL_SET_BY_USER" -eq 0 ]]; then
  echo "run_tests: TEST_DATABASE_URL=$TEST_DATABASE_URL" >&2
fi

# Default to backend/tests unless args already select files (avoid pytest backend/tests test_file.py).
use_default_path=1
for a in "$@"; do
  case "$a" in
  backend/tests/* | *.py) use_default_path=0 ;;
  esac
done
if [[ "$use_default_path" -eq 1 ]]; then
  set -- backend/tests "$@"
fi

exec uv run pytest "$@"
