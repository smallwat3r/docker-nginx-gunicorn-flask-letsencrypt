FROM python:3.13-slim

# you might want to install some required dependencies by your app here
# here is an example:
# RUN apt-get update && apt-get install -y \
#     gcc \
#     libpq-dev \
#     && rm -rf /var/lib/apt/lists/*

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_DEFAULT_TIMEOUT=100

WORKDIR /app

# create and use a non root user
RUN groupadd --system appuser && \
    useradd --system --create-home --gid appuser --shell /sbin/nologin appuser
USER appuser
ENV PATH="/home/appuser/.local/bin:${PATH}"

COPY requirements.txt .
RUN pip install --user -r requirements.txt

COPY --chown=appuser:appuser . .

CMD ["gunicorn", "-c", "gunicorn.conf.py", "wsgi:app"]
