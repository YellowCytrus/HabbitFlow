# Деплой HabitFlow на чистый Ubuntu 24.04 (VPS)

Пример: новый сервер, IP `45.38.37.94`, домен `habbit-flow.ru`.

## Что сделать тебе (руками)

1. **DNS у регистратора** (после того как сервер готов):
   - Запись **A** для `@` (корень домена) → `45.38.37.94` (или актуальный IP из `curl -4 ifconfig.me` на сервере).
   - По желанию **A** для `www` → тот же IP (если включишь `WITH_WWW=1` в скрипте).

2. **Один раз на сервере** — склонировать репозиторий и запустить bootstrap (см. ниже). Репозиторий должен быть доступен по **HTTPS** (публичный GitHub) или настроить **SSH-ключ** для `git@...`.

3. **Секреты провайдеров** — после bootstrap открыть `.env` в корне проекта и при необходимости заполнить:
   - `YANDEX_CLIENT_ID`, `YANDEX_CLIENT_SECRET`
   - `RESEND_API_KEY` и корректный `SMTP_FROM` (если пишешь почту через Resend)
   - затем: `docker compose up -d --force-recreate`

4. **Яндекс OAuth** — в приложении указать Redirect URI:
   `https://ТВОЙ-ДОМЕН.ru/api/v1/auth/oauth/callback`  
   и «хост страницы» / suggest hostname: `https://ТВОЙ-ДОМЕН.ru`

## Команды на сервере (копипаста)

Подставь свой URL репозитория и домен.

```bash
# зайти под root (или везде sudo)
ssh root@45.38.37.94

apt-get update -qq && apt-get install -y git

# пример: замени на свой remote
cd /root
git clone https://github.com/ТВОЙ_ЛОГИН/HabitFlow.git
cd HabitFlow

chmod +x scripts/vps-bootstrap.sh
./scripts/vps-bootstrap.sh habbit-flow.ru
```

С **www** в сертификате (и A-запись `www` в DNS):

```bash
WITH_WWW=1 ./scripts/vps-bootstrap.sh habbit-flow.ru
```

Если на сервере уже стоит nginx и ты **не хочешь**, чтобы скрипт его останавливал:

```bash
STOP_CONFLICTS=0 ./scripts/vps-bootstrap.sh habbit-flow.ru
```

(Тогда сам настрой прокси на `127.0.0.1:5173` и TLS.)

## Что делает `vps-bootstrap.sh`

- Ставит **Docker**, **docker compose**, **Caddy**, **UFW** (22, 80, 443).
- По возможности освобождает **80/443** (останавливает nginx/apache).
- Создаёт **`.env`** из `backend/.env.example` с новыми **JWT_SECRET** и **POSTGRES_PASSWORD** и с `FRONTEND_ORIGIN` / `OAUTH_REDIRECT_BASE` на `https://домен` (существующий `.env` не трогает).
- Запускает **`./deploy.sh`** (БД, миграции, API, фронт).
- Пишет **`/etc/caddy/Caddyfile`**: HTTPS на домен → прокси на `127.0.0.1:5173` (nginx внутри контейнера `web` уже проксирует `/api` на API).

## Проверки

```bash
docker compose -f /root/HabitFlow/docker-compose.yml ps
curl -sI http://127.0.0.1:5173 | head -3
systemctl status caddy --no-pager
curl -sI https://habbit-flow.ru | head -5
```

## Смена пароля Postgres после первого запуска

Если меняешь `POSTGRES_PASSWORD` в `.env` при **уже существующем** volume БД, пароль внутри Postgres **не обновится сам**. Либо `docker compose down -v` (данные пропадут), либо `ALTER USER` внутри контейнера `db`. Проще на новом сервере **не трогать** пароль после bootstrap или сразу пересоздать volume.

## Повторный запуск: «Порты 80/443 всё ещё заняты», а в выводе только `caddy`

Скрипт старых версий не отличал **Caddy** от чужого процесса. Обнови `vps-bootstrap.sh` (`git pull`) и запусти снова, например:

`SKIP_DEPLOY=1 WITH_WWW=1 ./scripts/vps-bootstrap.sh habbit-flow.ru`

Либо вручную в `/etc/caddy/Caddyfile` первая строка блока:

`habbit-flow.ru, www.habbit-flow.ru {`

и `systemctl reload caddy`.

## Ошибка apt: `containerd.io : Conflicts: containerd`

На сервере уже стоит **Docker CE** (с сайта Docker), а скрипт пытался поставить **docker.io** из Ubuntu — пакеты конфликтуют.

**Обнови скрипт** (`git pull`) и запусти снова **без полного деплоя**:

```bash
cd ~/HabbitFlow
git pull
SKIP_DEPLOY=1 ./scripts/vps-bootstrap.sh habbit-flow.ru
```

Если не хочешь тянуть git: только Caddy и UFW вручную:

```bash
apt-get update -qq && apt-get install -y caddy ufw
ufw allow OpenSSH && ufw allow 80/tcp && ufw allow 443/tcp && ufw --force enable
```

Дальше создай `/etc/caddy/Caddyfile` как в скрипте (блок `habbit-flow.ru { reverse_proxy 127.0.0.1:5173 }`) и `systemctl enable --now caddy`.

## Обновление кода позже

```bash
cd /root/HabitFlow
git pull
./deploy.sh
docker compose up -d --force-recreate
systemctl reload caddy
```
