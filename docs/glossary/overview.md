# Глоссарий

- **CurrentUser**: FastAPI-зависимость, которая аутентифицирует Bearer-токен и загружает активного пользователя.
- **Pending Registration**: временное состояние регистрации до подтверждения кода из email.
- **Habit Log**: дневная запись статуса привычки (`full`, `micro`, `missed`).
- **Recurrence Rule**: JSON-правило расписания (`daily` или `weekly` с ISO-номерами дней недели).
- **Goal Datetime**: следующий UTC-момент, когда уведомление становится due.
- **Idempotency Key**: ключ дедупликации уведомлений, используемый в session storage на frontend.
- **Notification Self-Healing**: служебная логика, снимающая stale-processing и пересчитывающая пропущенные уведомления.
- **Layered Monolith**: единый deployable-backend с внутренними слоями API/service/persistence.

См. также:
- [Обзор архитектуры](../architecture/overview.md)
- [Обзор базы данных](../database/overview.md)
- [Поток напоминаний](../flows/reminders.md)
