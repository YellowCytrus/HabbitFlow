# Эндпоинты auth

Префикс auth-роутера: `/api/v1/auth`.

## Публичные эндпоинты

- `POST /register`: создает/обновляет `pending_registrations` и отправляет код.
- `POST /verify-registration`: подтверждает код и создает строку в `users` + дефолтные записи.
- `POST /resend-registration-code`: перевыпускает код, если регистрация в pending-состоянии.
- `POST /login`: проверяет пароль и возвращает пару токенов.
- `POST /refresh`: проверяет refresh-токен и возвращает новый access-токен.
- `POST /verify-email`: подтверждает токен смены email.
- `GET /oauth/{provider}`: редиректит пользователя на OAuth-провайдера (Yandex/VK).
- `GET /oauth/callback`: обменивает provider code и авторизует пользователя.

## Защищенный эндпоинт

- `POST /logout`: требует `CurrentUser`; сейчас реализован как stateless-acknowledgement.

## Валидация и правила

- Минимальная длина пароля при регистрации задается схемой.
- Код подтверждения — 6 цифр.
- Password-login запрещен для неактивных и неподтвержденных password-аккаунтов.
- OAuth-пользователи могут существовать без `password_hash`.

## Побочные эффекты

- Отправка email через background task и `email_util`.
- OAuth callback выполняет внешние HTTP-запросы к token/profile API провайдеров.
- `_ensure_defaults` создает строки `notification_settings` и `user_subscriptions`.

См. также:
- [Поток auth и OAuth](../flows/auth_and_oauth.md)
- [Обработка ошибок](../errors/overview.md)
- [Конфигурация](../config/overview.md)
