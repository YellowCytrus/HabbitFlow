#!/usr/bin/env bash
set -euo pipefail

# Quick production-style bring-up on a VPS with Docker.
# Copy .env or export JWT_SECRET, FRONTEND_ORIGIN, OAUTH_*, SMTP_* as needed.

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

if ! command -v docker >/dev/null 2>&1; then
  echo "Docker is required." >&2
  exit 1
fi

docker compose build api db
docker compose up -d db
echo "Waiting for Postgres..."
sleep 5
docker compose run --rm api sh -c "alembic upgrade head"
docker compose up -d api

if [[ -f frontend/package.json ]]; then
  docker compose build web 2>/dev/null && docker compose up -d web || true
fi

echo "API should be on :8000 (see docker-compose.yml)."
