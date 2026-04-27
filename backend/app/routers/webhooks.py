import logging

from fastapi import APIRouter, Request
from fastapi.responses import JSONResponse

from app.config import settings

router = APIRouter(tags=["webhooks"])
logger = logging.getLogger(__name__)


@router.post("/webhooks/twenty")
async def twenty_webhook(request: Request):
    if request.headers.get("X-Webhook-Secret") != settings.twenty_webhook_secret:
        return JSONResponse(status_code=401, content={"error": "unauthorized"})

    payload = await request.json()
    logger.info(f"Webhook received: {payload}")

    event = payload.get("event")
    data = payload.get("data") or {}

    if event == "habit_logs.created":
        habit_id = data.get("habit_id")
        status = data.get("status")
        _ = (habit_id, status)
        # Здесь можно добавить обновление аналитики, метрики и уведомления.

    return {"status": "ok"}
