"""Insert sample users, habits, and logs. Run: cd backend && python -m scripts.seed"""

from datetime import date, timedelta

from app.database import SessionLocal
from app.models import (
    DeadlineType,
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

        users_data = [
            ("alice@example.com", "alice_secret_1", "Alice"),
            ("bob@example.com", "bob_secret_2", "Bob"),
            ("carol@example.com", "carol_secret_3", "Carol"),
        ]
        created_users: list[User] = []
        for email, pw, name in users_data:
            u = db.query(User).filter(User.email == email).first()
            if u is None:
                u = User(
                    email=email,
                    password_hash=hash_password(pw),
                    name=name,
                    role=UserRole.user,
                    is_active=True,
                    is_verified=True,
                    verification_token=None,
                )
                db.add(u)
                db.flush()
                db.add(
                    NotificationSettings(
                        user_id=u.id,
                        global_enabled=True,
                        reminder_tone=ReminderTone.neutral,
                    )
                )
                db.add(
                    UserSubscription(
                        user_id=u.id,
                        plan=SubscriptionPlan.free,
                        start_date=date.today(),
                        auto_renew=False,
                    )
                )
            created_users.append(u)

        db.commit()
        for u in created_users:
            db.refresh(u)

        alice = db.query(User).filter(User.email == "alice@example.com").first()
        if alice and db.query(Habit).filter(Habit.user_id == alice.id).count() == 0:
            h1 = Habit(
                user_id=alice.id,
                title="Morning stretch",
                main_goal="Feel awake and flexible",
                micro_step="One minute of neck rolls",
                adaptive_reminder=False,
                recurrence_rule={"type": "daily"},
                deadline_type=DeadlineType.slot,
                deadline_value="morning",
            )
            h2 = Habit(
                user_id=alice.id,
                title="Read",
                main_goal="Read 20 pages",
                micro_step="Read one paragraph",
                adaptive_reminder=True,
                recurrence_rule={"type": "weekly", "days": [1, 3, 5]},
                deadline_type=DeadlineType.exact,
                deadline_value="19:00-21:00",
            )
            h3 = Habit(
                user_id=alice.id,
                title="Tidy desk",
                main_goal="Clear workspace",
                micro_step=None,
                adaptive_reminder=False,
                recurrence_rule={"type": "daily"},
                deadline_type=DeadlineType.slot,
                deadline_value="evening",
            )
            db.add_all([h1, h2, h3])
            db.commit()
            db.refresh(h1)
            db.refresh(h2)
            db.refresh(h3)

            today = date.today()
            for i, h in enumerate([h1, h2, h3]):
                d0 = today - timedelta(days=2 - i % 2)
                db.add(HabitLog(habit_id=h.id, log_date=d0, status=HabitLogStatus.full))
                db.add(
                    HabitLog(
                        habit_id=h.id,
                        log_date=today - timedelta(days=1),
                        status=HabitLogStatus.micro if i == 0 else HabitLogStatus.full,
                    )
                )
            db.commit()

        print("Seed completed.")
    finally:
        db.close()


if __name__ == "__main__":
    main()
