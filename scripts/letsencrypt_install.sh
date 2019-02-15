#!/bin/bash
# File              : letsencrypt_install.sh
# Author            : Matthieu Petiteau <mpetiteau.pro@gmail.com>
# Date              : Fri 15 Feb 21:32:30 2019
# Last Modified Date: Fri 15 Feb 21:32:30 2019
# Last Modified By  : Matthieu Petiteau <mpetiteau.pro@gmail.com>

echo ------------------------------------------------------
echo This script needs to be run with sudo.
echo This install the letsencrypt client and get a certificate for \
    specified domain and email address.
echo Please wait and follow the instructions.
echo ------------------------------------------------------

git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt
/opt/letsencrypt/letsencrypt-auto certonly --standalone --email $1 -d $2
