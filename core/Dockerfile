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

# Create a group app and a non-root user app to run our container.
RUN addgroup app && \
    adduser --disabled-password --gecos "" --ingroup app app

# Switch to our app user. Add user bin to $PATH.
USER app
ENV PATH="/home/app/.local/bin:${PATH}"

# Work from
WORKDIR app/

# Copy our requirements to the workdir on our Alpine image and
# process to install.
COPY requirements.txt .
RUN pip install --user -r requirements.txt

# Copy content from our core/ directory to the workdir on our Alpine
# image so we've got the app ready to be launched.
COPY . .
