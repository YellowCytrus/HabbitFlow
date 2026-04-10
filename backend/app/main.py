import logging
import time
import uuid
from pathlib import Path

from fastapi import FastAPI, HTTPException, Request
from sqlalchemy import text
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles

from app.config import settings
from app.database import engine
from app.routers import auth, calendar, habits, notifications, profile

logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s %(name)s %(message)s")
log = logging.getLogger("habitflow.request")

app = FastAPI(title="HabitFlow API", version="0.1.0")
uploads_dir = Path(__file__).resolve().parents[1] / "uploads"
uploads_dir.mkdir(parents=True, exist_ok=True)
app.mount("/uploads", StaticFiles(directory=uploads_dir), name="uploads")

app.add_middleware(
    CORSMiddleware,
    allow_origins=[settings.frontend_origin, "http://127.0.0.1:5173"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.middleware("http")
async def request_logging(request: Request, call_next):
    rid = str(uuid.uuid4())[:8]
    start = time.perf_counter()
    try:
        response = await call_next(request)
    except Exception:
        log.exception("request_id=%s %s %s failed", rid, request.method, request.url.path)
        raise
    elapsed_ms = (time.perf_counter() - start) * 1000
    log.info(
        "request_id=%s %s %s -> %s %.2fms",
        rid,
        request.method,
        request.url.path,
        response.status_code,
        elapsed_ms,
    )
    response.headers["X-Request-ID"] = rid
    return response


@app.get("/health")
def health():
    return {"status": "ok"}


@app.get("/health/ready")
def health_ready():
    """Проверка доступности БД (для диагностики на сервере; /health остаётся лёгким)."""
    try:
        with engine.connect() as conn:
            conn.execute(text("SELECT 1"))
    except Exception:
        log.exception("readiness check: database unreachable")
        raise HTTPException(status_code=503, detail="database unavailable")
    return {"status": "ok", "database": "ok"}


app.include_router(auth.router, prefix="/api/v1")
app.include_router(habits.router, prefix="/api/v1")
app.include_router(profile.router, prefix="/api/v1")
app.include_router(calendar.router, prefix="/api/v1")
app.include_router(notifications.router, prefix="/api/v1")
