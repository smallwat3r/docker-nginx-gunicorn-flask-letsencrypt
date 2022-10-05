#!/bin/sh

certbot certonly --standalone -d $1 --email $2 -n --agree-tos --expand
/usr/sbin/crond -f &
/usr/sbin/nginx -g "daemon off;" #this call is blocking so it should be in last line
