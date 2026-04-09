#!/usr/bin/env bash
set -euo pipefail

# One-shot deployment for Ubuntu 24.04 VPS.
# Usage: ./deploy.sh
# Optional env vars:
#   SKIP_FRONTEND=1  - do not build/start web service

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

require_sudo() {
  if [[ "$EUID" -eq 0 ]]; then
    return
  fi
  if ! command -v sudo >/dev/null 2>&1; then
    echo "sudo is required to install Docker packages." >&2
    exit 1
  fi
}

install_docker_if_missing() {
  if command -v docker >/dev/null 2>&1; then
    return
  fi

  require_sudo
  echo "Docker not found. Installing Docker + Compose for Ubuntu 24.04..."
  sudo apt-get update
  sudo apt-get install -y docker.io docker-compose-v2
  sudo systemctl enable --now docker
}

ensure_docker_running() {
  if systemctl is-active --quiet docker; then
    return
  fi

  require_sudo
  echo "Starting Docker service..."
  sudo systemctl enable --now docker
}

wait_for_db_healthy() {
  local max_attempts=30
  local attempt=1

  echo "Waiting for Postgres healthcheck..."
  while (( attempt <= max_attempts )); do
    local state
    state="$(docker compose ps --format json db 2>/dev/null | python3 -c "import json,sys; d=json.load(sys.stdin); print((d[0].get('Health') or '').lower() if d else '')" || true)"
    if [[ "$state" == "healthy" ]]; then
      echo "Postgres is healthy."
      return
    fi
    sleep 2
    (( attempt++ ))
  done

  echo "Postgres did not become healthy in time." >&2
  docker compose logs db --tail=80 || true
  exit 1
}

install_docker_if_missing
ensure_docker_running

echo "Building containers..."
docker compose build db api
echo "Starting database..."
docker compose up -d db
wait_for_db_healthy

echo "Applying migrations..."
docker compose run --rm api sh -c "alembic upgrade head"

echo "Starting API..."
docker compose up -d api

if [[ "${SKIP_FRONTEND:-0}" != "1" && -f frontend/package.json ]]; then
  echo "Building and starting frontend..."
  docker compose build web
  docker compose up -d web
fi

SERVER_IP="$(hostname -I | awk '{print $1}')"
echo "Done."
echo "API: http://${SERVER_IP}:8000/health"
if [[ "${SKIP_FRONTEND:-0}" != "1" && -f frontend/package.json ]]; then
  echo "WEB: http://${SERVER_IP}:5173"
fi
