# Flask app Dockerfile
FROM python:3.8-alpine

# Install needed dependencies for our app to run.
RUN apk update \
  && apk add --no-cache \
    gcc \
    libffi-dev \
    musl-dev

WORKDIR /opt/app

# App non-root user
ENV GROUP=app
ENV USER=flask
ENV UID=12345
ENV GID=23456
RUN addgroup --gid "$GID" "$GROUP" \
  && adduser --uid "$UID" \
    --disabled-password \
    --gecos "" \
    --ingroup "$GROUP" \
    "$USER"

# Switch to the non-root user
USER "$USER"
ENV PATH="/home/$USER/.local/bin:${PATH}"

# Copy requirements file to our container, install, and remove
# files to we don't need to reduce the container size
COPY requirements.txt .
RUN pip install \
    --no-cache-dir \
    --no-warn-script-location \
    --user \
    -r requirements.txt \
  && find "/home/$USER/.local" \
    \( -type d -a -name test -o -name tests \) \
    -o \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
    -exec rm -rf '{}' +

# Copy app to container (with privileges to non-root user)
COPY --chown=$USER:$GROUP . .

# Gunicorn is run from the docker-compose file
