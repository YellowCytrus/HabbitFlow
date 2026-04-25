# Эндпоинты profile, calendar, notifications

## Profile (`/api/v1/profile`)

- `GET /profile`: возвращает публичные данные пользователя, настройки уведомлений и тариф.
- `PUT /profile`: обновляет имя/email; смена email может запустить поток верификации.
- `POST /profile/avatar`: валидирует тип/размер изображения и сохраняет файл в uploads.
- `PUT /profile/settings`: обновляет настройки напоминаний и таймзону.
- `POST /profile/change-password`: доступно только password-аккаунтам; проверяет старый пароль.

## Calendar (`/api/v1/calendar`)

- `GET /calendar?year=&month=`: карта интенсивности месяца на основе ratio due-vs-done.
- `GET /calendar/day?date=`: список due-привычек и их статус за выбранный день.

## Notifications (`/api/v1/notifications`)

- `GET /notifications/due`: возвращает due-уведомления для текущего пользователя:
  - `notification_id`
  - `goal_datetime`
  - `idempotency_key`
  - `payload`

Этот эндпоинт используется frontend-поллингом напоминаний.

## Важные особенности

- URL аватара формируется из backend-origin + пути к статике uploads.
- Валидация таймзоны опирается на IANA-идентификаторы.
- Запрос due-уведомлений исключает записи с `is_processing = true`.

См. также:
- [Жизненный цикл запроса](../flows/request_lifecycle.md)
- [Поток напоминаний](../flows/reminders.md)
- [Обработка ошибок](../errors/overview.md)
