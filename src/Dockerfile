FROM python:3.13-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_DEFAULT_TIMEOUT=100

WORKDIR /app

RUN groupadd --system appuser && \
    useradd --system --create-home --gid appuser --shell /sbin/nologin appuser

USER appuser
ENV PATH="/home/appuser/.local/bin:${PATH}"

COPY requirements.txt .
RUN pip install --user -r requirements.txt

COPY --chown=appuser:appuser . .

CMD ["gunicorn", "-c", "gunicorn.conf.py", "app:app"]
