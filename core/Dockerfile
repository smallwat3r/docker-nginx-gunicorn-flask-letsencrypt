FROM alpine:3.8

RUN apk update && \
    apk add build-base python3 python3-dev libffi-dev libressl-dev && \
    cd /usr/bin && \
    ln -sf python3 python && \
    ln -sf pip3 pip && \
    pip install --upgrade pip

ENV APP_PATH /usr/src/app

RUN mkdir -p $APP_PATH
WORKDIR $APP_PATH/core

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

CMD [ "gunicorn", "-c", "gunicorn_ini.py", "flask_app:app" ]
