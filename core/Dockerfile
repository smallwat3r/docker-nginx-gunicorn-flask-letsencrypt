FROM alpine:3.7

MAINTAINER Matthieu Petiteau "mpetiteau.pro@gmail.com"

RUN apk update && \
    apk add build-base python3 python3-dev libffi-dev libressl-dev && \
    cd /usr/local/bin && \
    ln -s /usr/bin/python3 python && \
    pip3 install --upgrade pip

ENV APP_PATH /usr/src/app

RUN mkdir -p $APP_PATH
WORKDIR $APP_PATH/core

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

CMD [ "gunicorn", "-c", "gunicorn_ini.py", "flask_app:app" ]
