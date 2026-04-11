#!/usr/bin/env bash
# Автоматическая первичная настройка Ubuntu 24.04 под HabitFlow:
# Docker, UFW, .env с секретами, deploy.sh, Caddy (HTTPS → 127.0.0.1:5173).
#
# Запуск (из корня клона репозитория, под root):
#   sudo ./scripts/vps-bootstrap.sh habbit-flow.ru
#
# С www в сертификате (нужна A-запись www → этот же IP):
#   sudo WITH_WWW=1 ./scripts/vps-bootstrap.sh habbit-flow.ru
#
# Если 80/443 заняты (nginx/apache), скрипт остановит их (STOP_CONFLICTS=1 по умолчанию).
set -euo pipefail

DOMAIN="${1:-${DOMAIN:-}}"
STOP_CONFLICTS="${STOP_CONFLICTS:-1}"
WITH_WWW="${WITH_WWW:-0}"

if [[ -z "$DOMAIN" ]]; then
  echo "Укажи домен: sudo $0 habbit-flow.ru" >&2
  exit 1
fi

if [[ "$EUID" -ne 0 ]]; then
  echo "Запусти под root: sudo $0 $DOMAIN" >&2
  exit 1
fi

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

if [[ ! -f "$ROOT/deploy.sh" ]]; then
  echo "Не найден deploy.sh в $ROOT — запускай скрипт из корня репозитория HabitFlow." >&2
  exit 1
fi

echo "=== Проверка портов 80 и 443 ==="
if ss -tlnp 2>/dev/null | grep -qE ':80 |:443 '; then
  ss -tlnp | grep -E ':80 |:443 ' || true
  if [[ "$STOP_CONFLICTS" == "1" ]]; then
    echo "Останавливаю типичные конфликтующие сервисы..."
    systemctl stop nginx 2>/dev/null || true
    systemctl disable nginx 2>/dev/null || true
    systemctl stop apache2 2>/dev/null || true
    systemctl disable apache2 2>/dev/null || true
  fi
  if ss -tlnp 2>/dev/null | grep -qE ':80 |:443 '; then
    echo "Порты 80/443 всё ещё заняты. Освободи их вручную или установи STOP_CONFLICTS=0 и настрой прокси сам." >&2
    ss -tlnp | grep -E ':80 |:443 ' || true
    exit 1
  fi
fi

export DEBIAN_FRONTEND=noninteractive
echo "=== apt: Docker, Compose, Caddy, UFW ==="
apt-get update -qq
apt-get install -y docker.io docker-compose-v2 caddy ufw curl git ca-certificates

systemctl enable --now docker

echo "=== UFW ==="
ufw allow OpenSSH
ufw allow 80/tcp
ufw allow 443/tcp
ufw --force enable || true

echo "=== .env в корне репозитория ==="
if [[ -f "$ROOT/.env" ]]; then
  echo "Файл .env уже есть — не перезаписываю. Проверь FRONTEND_ORIGIN и OAUTH_REDIRECT_BASE на https://$DOMAIN"
else
  if [[ ! -f "$ROOT/backend/.env.example" ]]; then
    echo "Нет backend/.env.example" >&2
    exit 1
  fi
  cp "$ROOT/backend/.env.example" "$ROOT/.env"
  chmod 600 "$ROOT/.env"
  export DOMAIN
  python3 <<'PY'
import os, re, secrets
from pathlib import Path
domain = os.environ["DOMAIN"]
path = Path(".env")
text = path.read_text(encoding="utf-8")
jwt = secrets.token_urlsafe(48)
pg = secrets.token_hex(24)  # без спецсимволов для URL в docker-compose
https_base = f"https://{domain}"

def set_line(s: str, key: str, value: str) -> str:
    return re.sub(rf"^{re.escape(key)}=.*$", f"{key}={value}", s, flags=re.M)

text = set_line(text, "JWT_SECRET", jwt)
text = set_line(text, "POSTGRES_PASSWORD", pg)
text = set_line(text, "FRONTEND_ORIGIN", https_base)
text = set_line(text, "OAUTH_REDIRECT_BASE", https_base)
path.write_text(text, encoding="utf-8")
print("Создан .env с новыми JWT_SECRET и POSTGRES_PASSWORD, URL под HTTPS.")
PY
  echo "Допиши в .env вручную: YANDEX_*, RESEND_*, SMTP_* при необходимости."
fi

echo "=== Docker Compose: деплой ==="
export COMPOSE_BAKE="${COMPOSE_BAKE:-true}"
bash "$ROOT/deploy.sh"

echo "=== Caddy ==="
CADDY_SITES="$DOMAIN"
if [[ "$WITH_WWW" == "1" ]]; then
  CADDY_SITES="$DOMAIN, www.$DOMAIN"
fi

cat > /etc/caddy/Caddyfile <<EOF
# HabitFlow — сгенерировано vps-bootstrap.sh
$CADDY_SITES {
    reverse_proxy 127.0.0.1:5173
}
EOF

caddy fmt --overwrite /etc/caddy/Caddyfile
caddy validate --config /etc/caddy/Caddyfile
systemctl enable caddy
systemctl restart caddy

sleep 2
if systemctl is-active --quiet caddy; then
  echo "Caddy: active"
else
  echo "Caddy не поднялся. Логи:" >&2
  journalctl -u caddy -n 40 --no-pager >&2 || true
  exit 1
fi

PUBLIC_IP="$(curl -4 -fsS --max-time 5 ifconfig.me 2>/dev/null || hostname -I | awk '{print $1}')"

echo ""
echo "=== Готово ==="
echo "Сайт (после распространения DNS): https://$DOMAIN"
echo "Проверка с сервера: curl -sI http://127.0.0.1:5173 | head -1"
echo "Публичный IP этого хоста (для A-записи): $PUBLIC_IP"
echo ""
echo "Дальше от тебя:"
echo "  1) В панели DNS: A @ и A www (если нужен www) → $PUBLIC_IP"
echo "  2) Яндекс OAuth Redirect URI: https://$DOMAIN/api/v1/auth/oauth/callback"
echo "  3) После правок .env: cd $ROOT && docker compose up -d --force-recreate"
echo ""
