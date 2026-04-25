# Эндпоинты habits

Префикс habits-роутера: `/api/v1/habits` (требует Bearer auth).

## Эндпоинты

- `GET /habits`: список привычек пользователя; `for_date` фильтрует по recurrence.
- `POST /habits`: создание привычки и синхронизация строки напоминания.
- `GET /habits/{habit_id}`: детали привычки со streak и completion-метриками.
- `PUT /habits/{habit_id}`: полное обновление и синхронизация уведомления.
- `DELETE /habits/{habit_id}`: мягкая деактивация уведомления и удаление привычки.
- `GET /habits/{habit_id}/logs`: список логов с опциональным диапазоном дат.
- `POST /habits/{habit_id}/logs`: upsert лога дня с валидацией расписания.

## Бизнес-правила

- Для free-плана действует лимит 5 привычек.
- Upsert лога отклоняет даты, которые не входят в расписание.
- Статус `micro` разрешен только если у привычки задан `micro_step`.
- Владение привычкой проверяется scoped-запросом (`Habit.user_id == CurrentUser.id`).

## Данные и транзакции

- Создание/обновление привычки включает запись в БД и синхронизацию уведомления в одном запросе.
- Upsert лога идемпотентен для `(habit_id, date)` за счет unique-ограничения.

См. также:
- [Поток напоминаний](../flows/reminders.md)
- [Обзор базы данных](../database/overview.md)
- [Эндпоинты profile/calendar/notifications](./profile_calendar_notifications.md)
