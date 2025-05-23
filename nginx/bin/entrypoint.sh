#!/bin/sh

: "${DOMAIN:?DOMAIN is not set or is empty}"
: "${EMAIL:?EMAIL is not set or is empty}"

# use envsubst to fill placeholders in the Nginx app config file,
# see nginx/Dockerfile for more details about what this does.
envsubst </etc/nginx/conf.d/app.conf >/etc/nginx/conf.d/app.subst.conf &&
  rm /etc/nginx/conf.d/app.conf

certbot certonly --standalone -d "${DOMAIN}" --email "${EMAIL}" -n --agree-tos --expand
/usr/sbin/crond && /usr/sbin/nginx -g "daemon off;"
