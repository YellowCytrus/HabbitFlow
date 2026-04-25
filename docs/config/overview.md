# Конфигурация и окружение

Источник конфигурации: `pydantic-settings` (`backend/app/config.py`) с поддержкой `.env`.

## Ключевые переменные

- `DATABASE_URL`: строка подключения к PostgreSQL.
- `JWT_SECRET`, `JWT_ALGORITHM`: параметры подписи токенов.
- `ACCESS_TOKEN_EXPIRE_MINUTES`, `REFRESH_TOKEN_EXPIRE_DAYS`.
- `FRONTEND_ORIGIN`: базовый URL для CORS и redirect-ов.
- `OAUTH_REDIRECT_BASE`: базовый backend URL для OAuth callback.

## Переменные email и уведомлений

- SMTP: `SMTP_HOST`, `SMTP_PORT`, `SMTP_USER`, `SMTP_PASSWORD`, `SMTP_FROM`.
- Fallback на Resend: `RESEND_API_KEY`.
- Таймзона пользователя хранится в БД (`notification_settings.user_timezone`), а не как глобальная env-переменная.

## Переменные OAuth-провайдеров

- Yandex: `YANDEX_CLIENT_ID`, `YANDEX_CLIENT_SECRET`.
- VK: `VK_CLIENT_ID`, `VK_CLIENT_SECRET`.

## Поведенческие заметки

- Класс настроек игнорирует неизвестные env-ключи (`extra=\"ignore\"`).
- При отсутствии SMTP/Resend отправка email деградирует до log-only режима.
- Базовый API URL на frontend задается через `VITE_API_URL`.

См. также:
- [Обзор деплоя](../deployment/overview.md)
- [Эндпоинты auth](../api/auth.md)
- [Поток напоминаний](../flows/reminders.md)
