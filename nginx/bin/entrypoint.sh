#!/bin/sh

: "${DOMAIN:?DOMAIN is not set or is empty}"
: "${EMAIL:?EMAIL is not set or is empty}"

certbot certonly --standalone -d "${DOMAIN}" --email "${EMAIL}" -n --agree-tos --expand
/usr/sbin/crond && /usr/sbin/nginx -g "daemon off;"
