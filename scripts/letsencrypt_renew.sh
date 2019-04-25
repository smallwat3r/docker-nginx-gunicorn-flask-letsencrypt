#!/bin/bash
# File              : letsencrypt_reniew.sh
# Author            : Matthieu Petiteau <mpetiteau.pro@gmail.com>
# Date              : Fri 15 Feb 21:56:20 2019
# Last Modified Date: Fri 15 Feb 21:56:20 2019
# Last Modified By  : Matthieu Petiteau <mpetiteau.pro@gmail.com>

echo "------------------------------------------------------" \
     "\nThis script needs to be run with sudo." \
     "\nThis renew the letsencrypt certificates for next 90 days." \
     "\nPlease follow the instructions." \
     "\n------------------------------------------------------"

/opt/letsencrypt/letsencrypt-auto certonly --standalone --renew-by-default --email $1 -d $2

echo "Job finished."
