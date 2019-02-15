#!/bin/bash
# File              : letsencrypt_reniew.sh
# Author            : Matthieu Petiteau <mpetiteau.pro@gmail.com>
# Date              : Fri 15 Feb 21:56:20 2019
# Last Modified Date: Fri 15 Feb 21:56:20 2019
# Last Modified By  : Matthieu Petiteau <mpetiteau.pro@gmail.com>

echo ------------------------------------------------------
echo This script needs to be run with sudo.
echo This renew the letsencrypt certificates for next 90 days.
echo Please follow the instructions.
echo ------------------------------------------------------

/opt/letsencrypt/letsencrypt-auto certonly --standalone --renew-by-default --email $1 -d $2
