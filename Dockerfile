FROM python:3.12-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends libpq5 \
    && rm -rf /var/lib/apt/lists/*

COPY pyproject.toml /app/
# pyproject.toml объявляет readme = "README.md"; без файла pip install -e падает.
# На сервере иногда нет README в копии репо — достаточно минимального текста.
RUN printf '%s\n' '# HabitFlow' > /app/README.md
COPY backend /app/backend

RUN pip install --no-cache-dir -U pip && pip install --no-cache-dir -e /app

WORKDIR /app/backend

ENV PYTHONPATH=/app/backend

CMD ["sh", "-c", "alembic upgrade head && python -m scripts.seed && uvicorn app.main:app --host 0.0.0.0 --port 8000"]
