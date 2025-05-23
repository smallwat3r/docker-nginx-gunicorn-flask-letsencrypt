FROM nginx:alpine-slim

RUN echo 'https://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    apk update && apk add --no-cache certbot busybox-suid

# replace existing files by our own configs
RUN rm /etc/nginx/nginx.conf && rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/
COPY ./conf.d/app.conf /etc/nginx/conf.d/

ARG APP
# we're using `envsubst` to replace placeholders in the Nginx config.
# to avoid conflicts, all actual dollar signs ($) in the config are replaced with ${DOLLAR}.
# environment variables like DOMAIN and EMAIL should already be set via the certbot.env file.
ENV APP="${APP}" DOLLAR='$'

# location certbot will place the challenges for domain validation on renewal
RUN mkdir -p /var/www/certbot

COPY ./bin/entrypoint.sh /entrypoint.sh
COPY ./bin/renew /etc/periodic/weekly/renew
RUN chmod +x /entrypoint.sh /etc/periodic/weekly/renew

ENTRYPOINT ../entrypoint.sh
