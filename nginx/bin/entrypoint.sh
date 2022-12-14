#!/bin/sh

certbot certonly --standalone -d $1 --email $2 -n --agree-tos --expand
/usr/sbin/crond -f &
/usr/sbin/nginx -g "daemon off;"  # this is run in the foreground, so need to be last
