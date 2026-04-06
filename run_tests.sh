#!/usr/bin/env bash
set -euo pipefail

# Backend pytest. By default integration tests start PostgreSQL in Docker (testcontainers).
# Usage:
#   ./run_tests.sh
#   ./run_tests.sh -v
#   ./run_tests.sh backend/tests/test_api_security.py -q
#
# Host PostgreSQL instead of testcontainers:
#   export TEST_DATABASE_URL=postgresql://user:pass@host:5432/habitflow_test
#   ./run_tests.sh
#   # or:
#   HABITFLOW_USE_HOST_POSTGRES=1 ./run_tests.sh
#   # (uses DATABASE_URL from .env with DB name habitflow_test, or docker compose port db 5432)

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

if [[ -n "${TEST_DATABASE_URL:-}" ]]; then
  export TEST_DATABASE_URL
  echo "run_tests: using TEST_DATABASE_URL (host/external)" >&2
elif [[ "${HABITFLOW_USE_HOST_POSTGRES:-0}" == "1" ]]; then
  if [[ -n "${DATABASE_URL:-}" ]]; then
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
  echo "run_tests: HABITFLOW_USE_HOST_POSTGRES TEST_DATABASE_URL=$TEST_DATABASE_URL" >&2
else
  unset TEST_DATABASE_URL || true
  echo "run_tests: embedded Postgres (testcontainers); for host DB use TEST_DATABASE_URL or HABITFLOW_USE_HOST_POSTGRES=1" >&2
fi

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
