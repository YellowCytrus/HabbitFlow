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

# Подхватываем корневой .env в оболочку (имена БД/юзера для ensure_database_exists).
load_root_env() {
  POSTGRES_USER="${POSTGRES_USER:-habitflow}"
  POSTGRES_DB="${POSTGRES_DB:-habitflow}"
  POSTGRES_PASSWORD="${POSTGRES_PASSWORD:-habitflow}"
  if [[ -f .env ]]; then
    set -a
    # shellcheck disable=SC1091
    source .env
    set +a
  fi
  POSTGRES_USER="${POSTGRES_USER:-habitflow}"
  POSTGRES_DB="${POSTGRES_DB:-habitflow}"
  POSTGRES_PASSWORD="${POSTGRES_PASSWORD:-habitflow}"
}

preflight_env() {
  if [[ ! -f .env ]]; then
    echo "Нет файла .env в корне репозитория (его читает docker-compose)." >&2
    echo "Создайте его из шаблона и заполните секреты:" >&2
    echo "  cp backend/.env.example .env && ${EDITOR:-nano} .env" >&2
    exit 1
  fi

  chmod 600 .env 2>/dev/null || true

  load_root_env

  if [[ -z "${JWT_SECRET:-}" || "$JWT_SECRET" == "dev-change-me-in-production" || "$JWT_SECRET" == "replace-with-long-random-string" ]]; then
    echo "Предупреждение: задайте в .env надёжный JWT_SECRET (длинная случайная строка)." >&2
  fi

  if [[ "$POSTGRES_PASSWORD" == "habitflow" ]]; then
    echo "Предупреждение: POSTGRES_PASSWORD по умолчанию. Для продакшена укажите сильный пароль в .env." >&2
  fi
}

ensure_docker_usable() {
  if docker info >/dev/null 2>&1; then
    return
  fi
  echo "Docker недоступен: нет прав или демон не запущен." >&2
  if [[ "$EUID" -ne 0 ]] && groups | grep -q '\bdocker\b'; then
    echo "Вы в группе docker, но команда не прошла — проверьте systemctl status docker." >&2
  elif [[ "$EUID" -ne 0 ]]; then
    echo "Либо запустите: sudo ./deploy.sh , либо: sudo usermod -aG docker \"\$USER\" и перелогиньтесь." >&2
  fi
  exit 1
}

wait_for_db_healthy() {
  local max_attempts=30
  local attempt=1

  echo "Waiting for Postgres healthcheck..."
  while (( attempt <= max_attempts )); do
    local container_id
    local state

    container_id="$(docker compose ps -q db 2>/dev/null || true)"
    if [[ -n "$container_id" ]]; then
      state="$(docker inspect --format '{{if .State.Health}}{{.State.Health.Status}}{{else}}{{.State.Status}}{{end}}' "$container_id" 2>/dev/null | tr '[:upper:]' '[:lower:]' || true)"
    else
      state=""
    fi

    if [[ "$state" == "healthy" || "$state" == "running" ]]; then
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

wait_for_api_healthy() {
  local max_attempts=45
  local attempt=1

  echo "Waiting for API healthcheck..."
  while (( attempt <= max_attempts )); do
    local container_id
    local state

    container_id="$(docker compose ps -q api 2>/dev/null || true)"
    if [[ -n "$container_id" ]]; then
      state="$(docker inspect --format '{{if .State.Health}}{{.State.Health.Status}}{{else}}{{.State.Status}}{{end}}' "$container_id" 2>/dev/null | tr '[:upper:]' '[:lower:]' || true)"
      if [[ "$state" == "healthy" ]]; then
        echo "API is healthy."
        return
      fi
    fi
    sleep 2
    (( attempt++ ))
  done

  echo "API did not become healthy in time." >&2
  docker compose logs api --tail=80 || true
  exit 1
}

ensure_database_exists() {
  local exists

  load_root_env
  echo "Ensuring database '${POSTGRES_DB}' exists..."
  exists="$(docker compose exec -T db psql -U "$POSTGRES_USER" -d postgres -tAc "SELECT 1 FROM pg_database WHERE datname='${POSTGRES_DB}'" | tr -d '[:space:]' || true)"
  if [[ "$exists" != "1" ]]; then
    docker compose exec -T db psql -U "$POSTGRES_USER" -d postgres -c "CREATE DATABASE \"${POSTGRES_DB}\";"
  fi
}

preflight_env

install_docker_if_missing
ensure_docker_running
ensure_docker_usable

echo "Pulling base images (db)..."
docker compose pull db 2>/dev/null || true

echo "Building containers..."
docker compose build db api
echo "Starting database..."
docker compose up -d db
wait_for_db_healthy
ensure_database_exists

echo "Applying migrations..."
docker compose run --rm api sh -c "alembic upgrade head"

echo "Starting API..."
docker compose up -d api
wait_for_api_healthy

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
