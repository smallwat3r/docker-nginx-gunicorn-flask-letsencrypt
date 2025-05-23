FROM nginx:alpine-slim

RUN echo 'https://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    apk update && apk add --no-cache certbot openrc busybox-extras

# replace existing files by our own configs
RUN rm /etc/nginx/nginx.conf && rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/
COPY ./conf.d/app.conf /etc/nginx/conf.d/

ARG APP
# use envsubst to fill variables in the Nginx config file. Because of that we also
# need to replace all the real dollar signs in the configs with ${DOLLAR}
# the env vars for DOMAIN and EMAIL should have already been set in the env by
# the certbot.env file
ENV APP="${APP}" DOLLAR='$'
RUN envsubst </etc/nginx/conf.d/app.conf >/etc/nginx/conf.d/app.subst.conf && \
    rm /etc/nginx/conf.d/app.conf

# required for certbot renewal
RUN mkdir /var/lib/certbot

COPY ./bin/entrypoint.sh /entrypoint.sh
COPY ./bin/renew /etc/periodic/weekly/renew
RUN chmod +x /entrypoint.sh /etc/periodic/weekly/renew

ENTRYPOINT ../entrypoint.sh
