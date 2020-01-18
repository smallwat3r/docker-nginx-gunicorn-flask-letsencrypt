# File     : Dockerfile
# Date     : 13.01.2020
# Author   : Matthieu Petiteau <mpetiteau.pro@gmail.com>
#
# Dockerfile to run our Flask app with Gunicorn.
#

FROM alpine:3.11.0

# Install needed dependencies for Python 3.
RUN apk update && \
    apk add build-base python3 python3-dev libffi-dev libressl-dev && \
    ln -sf /usr/bin/python3 /usr/bin/python && \
    ln -sf /usr/bin/pip3 usr/bin/pip && \
    pip install --upgrade pip

# Our application directory on our Alpine image.
ENV APP_PATH /usr/src/app
RUN mkdir -p $APP_PATH
WORKDIR $APP_PATH/core

# Create a group app and a non-root user app to run our container.
RUN addgroup app && \
    adduser --disabled-password --gecos "" --ingroup app --no-create-home app

# Copy our requirement file on our Alpine image and installs.
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy our core/ directory to our Alpine image so we've got the app ready.
COPY . .

# Switch to our app user.
USER app
