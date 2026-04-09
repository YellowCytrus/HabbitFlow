# HabitFlow MVP

> Примечание: сейчас рассылка кода подтверждения на почту работает не со всеми доменами. Например письма не приходят на @yandex.ru, но приходят на почту @gmail.com. В будущем планирую сменить SMTP провайдера.

## Тестовый пользователь для демонстраици работы

На сайте уже зарегистрирован пользователь по имени Алина (логин: `alina@example.com`, пароль: `123`), которая 3 месяца пользовалась приложением.

Web app for habit tracking (FastAPI + Vue 3 + PostgreSQL).

## Local development

1. Start PostgreSQL (or use Docker Compose):

   ```bash
   docker compose up -d db
   ```

2. Backend:

   ```bash
   cd backend
   export DATABASE_URL=postgresql://habitflow:habitflow@localhost:5432/habitflow
   pip install -e ..
   alembic upgrade head
   uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
   ```

3. Frontend:

   ```bash
   cd frontend
   npm install
   npm run dev
   ```

4. Seed data (requires backend env and DB):

   ```bash
   cd backend && PYTHONPATH=. python -m scripts.seed
   ```

Configure `.env` in `backend/` (see `backend/.env.example`).

## Docker (API + DB)

```bash
docker compose up --build api db
```

The `web` service builds the Vue app when `frontend/` is present.
