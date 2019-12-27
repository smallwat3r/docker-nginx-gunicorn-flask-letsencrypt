#!/bin/bash
# File  : letsencrypt_renew.sh
# Author: Matthieu Petiteau <mpetiteau.pro@gmail.com>
# Date  : 04.12.2019

/opt/letsencrypt/letsencrypt-auto certonly --standalone --renew-by-default --email $1 --agree-tos --no-eff-email -d $2
