# File     : Dockerfile
# Date     : 13.01.2020
# Author   : Matthieu Petiteau <mpetiteau.pro@gmail.com>

FROM alpine:3.11.0

RUN apk update && \
    apk add build-base python3 python3-dev libffi-dev libressl-dev && \
    ln -sf /usr/bin/python3 /usr/bin/python && \
    ln -sf /usr/bin/pip3 usr/bin/pip && \
    pip install --upgrade pip

ENV APP_PATH /usr/src/app

RUN mkdir -p $APP_PATH
WORKDIR $APP_PATH/core

# Create a non-root user to run our app container.
RUN addgroup app && \
    adduser --disabled-password --gecos "" --ingroup app --no-create-home app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

USER app

CMD [ "gunicorn", "-c", "gunicorn_ini.py", "flask_app:app" ]
