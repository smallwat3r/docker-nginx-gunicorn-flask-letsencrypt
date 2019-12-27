#!/bin/bash
# File  : letsencrypt_install.sh
# Author: Matthieu Petiteau <mpetiteau.pro@gmail.com>
# Date  : 04.12.2019

git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt
/opt/letsencrypt/letsencrypt-auto certonly --standalone --email $1 -d $2
