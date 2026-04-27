from __future__ import annotations

import logging
from typing import Any

import httpx
from sqlalchemy.orm import Session

from app.config import settings
from app.models import Habit, HabitLog, User

log = logging.getLogger(__name__)


def _crm_enabled() -> bool:
    if not settings.twenty_api_url or not settings.twenty_api_key:
        log.warning("Twenty CRM sync skipped: TWENTY_API_URL or TWENTY_API_KEY is empty")
        return False
    return True


def graphql_request(query: str, variables: dict | None = None) -> dict[str, Any]:
    payload = {"query": query, "variables": variables or {}}
    headers = {
        "Authorization": settings.twenty_api_key,
        "Content-Type": "application/json",
    }
    with httpx.Client(timeout=10.0, trust_env=False) as client:
        response = client.post(settings.twenty_api_url, json=payload, headers=headers)
        response.raise_for_status()
        data = response.json()
    if data.get("errors"):
        raise RuntimeError(f"CRM GraphQL error: {data['errors']}")
    return data.get("data") or {}


def _try_graphql_variants(variants: list[tuple[str, dict[str, Any]]]) -> dict[str, Any]:
    last_error: Exception | None = None
    for query, variables in variants:
        try:
            return graphql_request(query, variables)
        except Exception as exc:
            last_error = exc
    if last_error:
        raise last_error
    raise RuntimeError("No GraphQL variants provided")


def sync_user_to_crm(user: User, db: Session) -> None:
    if not _crm_enabled():
        return
    try:
        if not user.crm_synced:
            query = """
            mutation CreatePerson($name: FullNameCreateInput, $email: String) {
              createPerson(data: {name: $name, emails: {primaryEmail: $email}}) {
                id
              }
            }
            """
            data = graphql_request(
                query,
                {"name": {"firstName": user.name}, "email": user.email},
            )
            created = data.get("createPerson") or {}
            crm_id = created.get("id")
            if not crm_id:
                raise RuntimeError("CRM did not return person id")
            user.external_id = crm_id
            user.crm_synced = True
            db.commit()
            return

        if not user.external_id:
            log.warning("User %s marked synced without external_id; skip CRM update", user.id)
            return
        query = """
        mutation UpdatePerson($id: UUID!, $name: FullNameUpdateInput, $email: String) {
          updatePerson(id: $id, data: {name: $name, emails: {primaryEmail: $email}}) {
            id
          }
        }
        """
        graphql_request(
            query,
            {"id": user.external_id, "name": {"firstName": user.name}, "email": user.email},
        )
    except Exception:
        db.rollback()
        log.exception("Failed to sync user %s to Twenty CRM", user.id)


def ensure_user_synced_to_crm(user: User, db: Session) -> bool:
    """Try to sync a user before CRM-dependent actions."""
    if user.crm_synced and user.external_id:
        return True
    sync_user_to_crm(user, db)
    db.refresh(user)
    return bool(user.crm_synced and user.external_id)


def sync_habit_to_crm(habit: Habit, db: Session) -> None:
    if not _crm_enabled():
        return
    try:
        user = db.get(User, habit.user_id)
        if not user or not user.external_id:
            log.warning("Habit %s CRM sync skipped: user external_id is missing", habit.id)
            return

        title = habit.title
        name = habit.title
        main_goal = habit.main_goal
        micro_step = habit.micro_step or ""

        if habit.crm_id:
            update_variants = [
                (
                    """
                    mutation UpdateHabit($id: UUID!, $name: String!, $title: String!, $mainGoal: String, $microStep: String) {
                      updateHabit(id: $id, data: {name: $name, title: $title, mainGoal: $mainGoal, microStep: $microStep}) {
                        id
                      }
                    }
                    """,
                    {"id": habit.crm_id, "name": name, "title": title, "mainGoal": main_goal, "microStep": micro_step},
                ),
                (
                    """
                    mutation UpdateHabit($id: UUID!, $name: String!, $title: String!, $main_goal: String, $micro_step: String) {
                      updateHabit(id: $id, data: {name: $name, title: $title, main_goal: $main_goal, micro_step: $micro_step}) {
                        id
                      }
                    }
                    """,
                    {"id": habit.crm_id, "name": name, "title": title, "main_goal": main_goal, "micro_step": micro_step},
                ),
                (
                    """
                    mutation UpdateHabit($id: UUID!, $name: String!, $title: String!) {
                      updateHabit(id: $id, data: {name: $name, title: $title}) {
                        id
                      }
                    }
                    """,
                    {"id": habit.crm_id, "name": name, "title": title},
                ),
            ]
            _try_graphql_variants(update_variants)
            return

        create_variants = [
            (
                """
                mutation CreateHabit($name: String!, $title: String!, $mainGoal: String, $microStep: String) {
                  createHabit(data: {name: $name, title: $title, mainGoal: $mainGoal, microStep: $microStep}) {
                    id
                  }
                }
                """,
                {"name": name, "title": title, "mainGoal": main_goal, "microStep": micro_step},
            ),
            (
                """
                mutation CreateHabit($name: String!, $title: String!, $main_goal: String, $micro_step: String) {
                  createHabit(data: {name: $name, title: $title, main_goal: $main_goal, micro_step: $micro_step}) {
                    id
                  }
                }
                """,
                {"name": name, "title": title, "main_goal": main_goal, "micro_step": micro_step},
            ),
            (
                """
                mutation CreateHabit($name: String!, $title: String!) {
                  createHabit(data: {name: $name, title: $title}) {
                    id
                  }
                }
                """,
                {"name": name, "title": title},
            ),
        ]
        data = _try_graphql_variants(create_variants)
        created = data.get("createHabit") or {}
        crm_id = created.get("id")
        if crm_id:
            habit.crm_id = crm_id
            db.commit()
    except Exception:
        db.rollback()
        log.exception("Failed to sync habit %s to Twenty CRM", habit.id)


def sync_habit_log_to_crm(log_item: HabitLog, db: Session) -> None:
    if not _crm_enabled():
        return
    try:
        habit = db.get(Habit, log_item.habit_id)
        if not habit:
            log.warning("Habit log %s CRM sync skipped: habit not found", log_item.id)
            return
        status_value = log_item.status.value
        status_variants = [status_value, status_value.upper(), status_value.capitalize()]
        variants: list[tuple[str, dict[str, Any]]] = []
        for status in status_variants:
            variants.extend(
                [
                    (
                        """
                        mutation CreateHabitLog($status: String!, $habitId: UUID) {
                          createHabitLog(data: {status: $status, habitId: $habitId}) {
                            id
                          }
                        }
                        """,
                        {"status": status, "habitId": habit.crm_id},
                    ),
                    (
                        """
                        mutation CreateHabitLog($status: String!, $habitId: UUID) {
                          createHabitLog(data: {status: $status, habit: {connect: $habitId}}) {
                            id
                          }
                        }
                        """,
                        {"status": status, "habitId": habit.crm_id},
                    ),
                ]
            )
        _try_graphql_variants(variants)
    except Exception:
        log.exception("Failed to sync habit log %s to Twenty CRM", log_item.id)
