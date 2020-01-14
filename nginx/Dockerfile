# File     : Dockerfile
# Date     : 13.01.2020
# Author   : Matthieu Petiteau <mpetiteau.pro@gmail.com>

FROM nginx:1.17.7-alpine

RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/

RUN rm /etc/nginx/conf.d/default.conf
COPY ./conf.d/flask_app.conf /etc/nginx/conf.d/

ARG DOMAIN
ARG FLASK

RUN export DOLLAR='$' && \
    export FLASK_APP=$FLASK && \
    export DOMAIN=$DOMAIN && \
    envsubst < /etc/nginx/conf.d/flask_app.conf > /etc/nginx/conf.d/flask_app.conf
