# Обзор API

Базовый префикс: `/api/v1`.

Для защищенных эндпоинтов используется Bearer JWT. Публичные маршруты ограничены health-check и сценариями onboarding в auth.

## Поверхность роутеров

- `/auth`: регистрация, вход, refresh, подтверждение email, OAuth.
- `/habits`: CRUD привычек и логи.
- `/profile`: профиль пользователя, настройки, пароль, аватар.
- `/calendar`: агрегированное состояние привычек по месяцу/дню.
- `/notifications`: выдача due-пейлоада напоминаний.

## Стиль контрактов

- Request/response-схемы в основном задаются Pydantic-моделями (`schemas.py`).
- Ошибки чаще всего возвращаются как `HTTPException` со строкой `detail`.
- Во всех доменных сущностях используются UUID-идентификаторы.

## Аутентификация и токены

- Access и refresh токены выдаются после login/verify-registration.
- Access токен обновляется через `/auth/refresh`.
- Frontend при 401 делает одну попытку refresh и повторяет исходный запрос.

Детальная документация эндпоинтов:
- [Эндпоинты auth](./auth.md)
- [Эндпоинты habits](./habits.md)
- [Эндпоинты profile/calendar/notifications](./profile_calendar_notifications.md)

См. также:
- [Жизненный цикл запроса](../flows/request_lifecycle.md)
- [Обработка ошибок](../errors/overview.md)
- [Модели и валидация](../models/overview.md)
