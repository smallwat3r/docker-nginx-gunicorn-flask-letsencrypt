# Author   : Matthieu Petiteau <mpetiteau.pro@gmail.com>
# Dockerfile to run our Flask app with Gunicorn.
FROM python:3.8.2-alpine3.11

# Install needed dependencies for our app to run.
RUN apk update \
  && apk add --no-cache \
    gcc \
    libffi-dev \
    musl-dev

# Create a group app and a non-root user app to run our app.
RUN addgroup -g 12001 app \
  && adduser -u 12001 --disabled-password --gecos "" --ingroup app app

# Switch to the non-root user.
USER app

# App location in our container.
WORKDIR /opt/app

# Add ~/.local/bin to user path.
ENV PATH="/home/app/.local/bin:${PATH}"

# Copy requirements file to our container, install, and remove
# files to we don't need.
COPY requirements.txt .
RUN pip install --no-cache-dir --user -r requirements.txt \
  && find /home/app/.local \
     \( -type d -a -name test -o -name tests \) \
     -o \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
     -exec rm -rf '{}' +

# Copy our app to our container, and run gunicorn.
COPY . .
