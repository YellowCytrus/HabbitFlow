from collections.abc import Generator

from sqlalchemy import create_engine
from sqlalchemy.orm import Session, declarative_base, sessionmaker

from app.config import settings

# pool_pre_ping: проверка соединения перед выдачей из пула (мертвые сокеты).
# pool_recycle: периодически закрывать idle-соединения до типичных NAT/firewall таймаутов (~1h).
engine = create_engine(
    settings.database_url,
    pool_pre_ping=True,
    pool_recycle=2700,
    pool_timeout=30,
)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()


def get_db() -> Generator[Session, None, None]:
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
