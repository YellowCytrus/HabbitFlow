from datetime import datetime, timezone
from typing import Annotated

from fastapi import APIRouter, Depends, Query
from sqlalchemy.orm import Session

from app.database import get_db
from app.deps import CurrentUser
from app.services.notification_service import due_notifications_for_user

router = APIRouter(prefix="/notifications", tags=["notifications"])


@router.get("/due")
def due_notifications(
    db: Annotated[Session, Depends(get_db)],
    user: CurrentUser,
    limit: int = Query(50, ge=1, le=200),
):
    return due_notifications_for_user(db, user.id, now_utc=datetime.now(timezone.utc), limit=limit)
