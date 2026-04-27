# Обзор backend

Корень backend: `backend/app`.

## Состав рантайма

- `main.py`: FastAPI-приложение, middleware, health/readiness, регистрация роутеров.
- `config.py`: загрузка настроек из окружения.
- `database.py`: SQLAlchemy engine/session и dependency provider.
- `deps.py`: auth-зависимость (`CurrentUser`) на основе Bearer JWT.
- `security.py`: хеширование паролей и работа с JWT.

## Функциональные модули

- `routers/auth.py`: регистрация, верификация, вход, refresh, OAuth start/callback.
- `routers/habits.py`: CRUD привычек и логи.
- `routers/profile.py`: профиль/настройки/пароль/аватар.
- `routers/calendar.py`: агрегации по месяцу и дню.
- `routers/notifications.py`: API-контракт due-уведомлений.

## Сервисные модули

- `services/notification_service.py`: создание/синхронизация/деактивация уведомлений.
- `services/notification_scheduler.py`: расчеты расписаний по таймзоне и recurrence.
- `services/notification_worker.py`: lock + обработка + перенос следующего запуска.
- `services/notification_self_healing.py`: снятие stale-lock и восстановление пропусков.
- `services/calendar_agg.py`, `services/streak.py`, `services/recurrence.py`: вычисления read-модели.

## Интеграции

- `integrations/crm.py`: синхронизация с Twenty CRM через GraphQL (`/graphql`).
- Используются env-переменные:
  - `TWENTY_API_URL`
  - `TWENTY_API_KEY`
- Локальные связи с CRM:
  - `User.external_id` + `User.crm_synced`
  - `Habit.crm_id`
- Базовые точки синхронизации:
  - пользователь: после регистрации/первого OAuth
  - привычка: после создания/обновления
  - лог привычки: после `POST /habits/{habit_id}/logs`
- Для CRM-зависимых действий в habits-роутере выполняется pre-check:
  - если пользователь/привычка еще не синхронизированы, backend сначала пытается досинхронизировать их автоматически.

## Асинхронность и побочные эффекты

- Большинство обработчиков синхронные; доступ к БД через sync SQLAlchemy.
- Async используется точечно: middleware и загрузка файла.
- Внешние side effects: SMTP/Resend email, HTTP-вызовы OAuth-провайдеров, GraphQL-вызовы в Twenty CRM.

См. также:
- [Жизненный цикл запроса](../flows/request_lifecycle.md)
- [Модели и валидация](../models/overview.md)
- [Обработка ошибок](../errors/overview.md)
- [Интеграция с CRM (Twenty)](../integrations/crm.md)
