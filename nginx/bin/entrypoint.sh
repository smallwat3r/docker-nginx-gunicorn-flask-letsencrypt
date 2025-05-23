#!/bin/sh

certbot certonly --standalone -d "${1}" --email "${2}" -n --agree-tos --expand
/usr/sbin/crond && /usr/sbin/nginx -g "daemon off;"
