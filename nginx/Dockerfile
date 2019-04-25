FROM nginx:latest

RUN rm /etc/nginx/conf.d/default.conf

ARG DOMAIN
ARG FLASK

ADD sites-enabled/nginx.conf /etc/nginx/conf.d/default.conf

RUN export DOLLAR='$' && \
    export FLASK_APP=$FLASK && \
    export DOMAIN=$DOMAIN && \
    envsubst < /etc/nginx/conf.d/default.conf > /etc/nginx/conf.d/default.conf
