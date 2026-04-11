"""Insert sample data for local development. Run: cd backend && python -m scripts.seed"""

from datetime import date, timedelta

from app.database import SessionLocal
from app.models import (
    Habit,
    HabitLog,
    HabitLogStatus,
    Message,
    NotificationSettings,
    ReminderTone,
    SubscriptionPlan,
    User,
    UserRole,
    UserSubscription,
)
from app.security import hash_password


ALINA_EMAIL = "alina@example.com"


def _status_for_day(day: date, habit_kind: str) -> HabitLogStatus:
    """Deterministic pseudo-random status distribution without extra deps."""
    score = day.toordinal() % 10
    if habit_kind == "daily":
        if score in (0, 7):
            return HabitLogStatus.missed
        if score in (3,):
            return HabitLogStatus.micro
        return HabitLogStatus.full
    if habit_kind == "weekdays":
        if score in (1,):
            return HabitLogStatus.missed
        if score in (5,):
            return HabitLogStatus.micro
        return HabitLogStatus.full
    # 3x/week
    if score in (2, 8):
        return HabitLogStatus.micro
    return HabitLogStatus.full


def _should_log_on_day(day: date, habit_kind: str) -> bool:
    if habit_kind == "daily":
        return True
    if habit_kind == "weekdays":
        return day.weekday() < 5
    # 3x/week: Mon/Wed/Fri
    return day.weekday() in (0, 2, 4)


def main() -> None:
    db = SessionLocal()
    try:
        if db.query(Message).count() == 0:
            db.add_all(
                [
                    Message(
                        text="Small steps still move you forward.",
                        category="encouragement",
                        tone="soft",
                        trigger_condition=None,
                    ),
                    Message(
                        text="Consistency beats intensity.",
                        category="encouragement",
                        tone="neutral",
                        trigger_condition=None,
                    ),
                    Message(
                        text="You can use a micro-step when energy is low.",
                        category="micro",
                        tone="soft",
                        trigger_condition=None,
                    ),
                ]
            )

        alina = db.query(User).filter(User.email == ALINA_EMAIL).first()
        if alina is None:
            alina = User(
                email=ALINA_EMAIL,
                password_hash=hash_password("123"),
                name="Алина",
                role=UserRole.user,
                is_active=True,
                is_verified=True,
                verification_token=None,
            )
            db.add(alina)
            db.flush()

        if alina.notification_settings is None:
            db.add(
                NotificationSettings(
                    user_id=alina.id,
                    global_enabled=True,
                    reminder_tone=ReminderTone.soft,
                    user_timezone="Europe/Moscow",
                )
            )

        if alina.subscription is None:
            db.add(
                UserSubscription(
                    user_id=alina.id,
                    plan=SubscriptionPlan.free,
                    start_date=date.today() - timedelta(days=90),
                    auto_renew=False,
                )
            )

        db.commit()
        db.refresh(alina)

        habits = db.query(Habit).filter(Habit.user_id == alina.id).all()
        if not habits:
            habits = [
                Habit(
                    user_id=alina.id,
                    title="Утренняя зарядка",
                    main_goal="15 минут движения для энергии с утра",
                    micro_step="2 минуты лёгкой разминки",
                    adaptive_reminder=True,
                    recurrence_rule={"type": "daily"},
                    deadline_type=None,
                    deadline_value=None,
                ),
                Habit(
                    user_id=alina.id,
                    title="План дня",
                    main_goal="Составить 3 ключевые задачи на день",
                    micro_step="Записать хотя бы 1 задачу",
                    adaptive_reminder=False,
                    recurrence_rule={"type": "weekly", "days": [1, 2, 3, 4, 5]},
                    deadline_type=None,
                    deadline_value=None,
                ),
                Habit(
                    user_id=alina.id,
                    title="Чтение",
                    main_goal="Читать минимум 20 страниц",
                    micro_step="Прочитать 2 страницы",
                    adaptive_reminder=True,
                    recurrence_rule={"type": "weekly", "days": [1, 3, 5]},
                    deadline_type=None,
                    deadline_value=None,
                ),
            ]
            db.add_all(habits)
            db.commit()
            for habit in habits:
                db.refresh(habit)

        has_logs = (
            db.query(HabitLog)
            .join(Habit, HabitLog.habit_id == Habit.id)
            .filter(Habit.user_id == alina.id)
            .first()
            is not None
        )
        if not has_logs:
            today = date.today()
            start_day = today - timedelta(days=89)
            habit_kind = {
                habits[0].id: "daily",
                habits[1].id: "weekdays",
                habits[2].id: "three_per_week",
            }

            for i in range(90):
                log_day = start_day + timedelta(days=i)
                for habit in habits:
                    kind = habit_kind[habit.id]
                    if not _should_log_on_day(log_day, kind):
                        continue
                    db.add(
                        HabitLog(
                            habit_id=habit.id,
                            log_date=log_day,
                            status=_status_for_day(log_day, kind),
                        )
                    )
            db.commit()

        print("Seed completed.")
    finally:
        db.close()


if __name__ == "__main__":
    main()
