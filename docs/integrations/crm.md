# Интеграция с CRM (Twenty)

Этот документ описывает, как backend синхронизирует пользователей, привычки и логи в Twenty CRM.

## Где находится интеграция

- Код интеграции: `backend/app/integrations/crm.py`
- Точки вызова:
  - `backend/app/routers/auth.py`
  - `backend/app/routers/habits.py`

## Конфигурация

Используются env-переменные:

- `TWENTY_API_URL` — GraphQL endpoint Twenty (обычно `http://twenty-server:3000/graphql` в docker-сети)
- `TWENTY_API_KEY` — API key для заголовка `Authorization` (обычно в формате `Bearer ...`)

Если одна из переменных пуста, синхронизация пропускается с warning-логом.

## Что хранится локально

- В `User`:
  - `external_id` — ID пользователя (person) в CRM
  - `crm_synced` — флаг, что первичная синхронизация выполнена
- В `Habit`:
  - `crm_id` — ID привычки в CRM-сущности `Habits`

Это связывает записи локальной БД и CRM без дублей.

## Поток синхронизации

### 1) Пользователь

- После регистрации (`verify-registration`) и первого OAuth-создания пользователя вызывается `sync_user_to_crm(...)`.
- Если пользователь еще не синхронизирован:
  - создается `Person` в CRM
  - сохраняются `external_id` и `crm_synced = true`
- Если уже синхронизирован:
  - отправляется `updatePerson(...)`

### 2) Привычка

- После `POST /habits` и `PUT /habits/{habit_id}` вызывается `sync_habit_to_crm(...)`.
- При создании привычки в CRM вызывается `createHabit(...)`, локально сохраняется `habit.crm_id`.
- При обновлении — `updateHabit(...)` по `habit.crm_id`.

### 3) Лог привычки

- После `POST /habits/{habit_id}/logs` вызывается `sync_habit_log_to_crm(...)`.
- Синк идет в CRM-сущность `Habit Logs` через `createHabitLog(...)`.

## Pre-sync правила в habits API

Перед CRM-зависимыми действиями применяется защитный pre-check:

- перед `POST /habits`:
  - backend пытается досинхронизировать пользователя (если не синхронизирован)
- перед `POST /habits/{habit_id}/logs`:
  - backend проверяет, что пользователь синхронизирован
  - backend проверяет, что у привычки есть `crm_id`; если нет — сначала пытается досинхронизировать привычку

Если обязательный sync не удался, API возвращает `503` (действие не выполняется).

## Маппинг полей

Интеграция ориентирована на кастомные CRM-сущности:

- `Habits`
  - `title`
  - `mainGoal` / `main_goal` (в зависимости от схемы)
  - `microStep` / `micro_step`
- `Habit Logs`
  - `status`
  - связь с `habit` (`habitId` или `habit.connect`)

Поля подбираются через fallback-варианты запросов, чтобы выдерживать отличия схемы (camelCase/snake_case, типы статусов).

## Обработка ошибок

- CRM-вызовы обернуты в `try/except`.
- Ошибки логируются, чтобы не терять контекст причины.
- Для части операций ошибки CRM не роняют весь запрос.
- Для действий, где sync обязателен (см. pre-check), неуспешный sync блокирует действие (`503`).

## Быстрая диагностика

1. Проверить endpoint и ключ из контейнера API:

   - `query { __typename }` должен возвращать `200` и `data`.

2. Проверить, что доступны нужные сущности:

   - `query { habits { edges { node { id } } } }`
   - `query { habitLogs { edges { node { id } } } }`

3. Проверить локальные связи:

   - `users.external_id`, `users.crm_synced`
   - `habits.crm_id`

4. Если данные уходят не в те поля:

   - сверить актуальную CRM-схему в Twenty (`Settings -> APIs & Webhooks`)
   - проверить логи `app.integrations.crm` на ошибки GraphQL.
