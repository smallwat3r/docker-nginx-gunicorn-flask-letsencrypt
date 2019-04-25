#!/bin/bash
# File              : letsencrypt_install.sh
# Author            : Matthieu Petiteau <mpetiteau.pro@gmail.com>
# Date              : Fri 15 Feb 21:32:30 2019
# Last Modified Date: Fri 15 Feb 21:32:30 2019
# Last Modified By  : Matthieu Petiteau <mpetiteau.pro@gmail.com>

echo "------------------------------------------------------" \
     "\nThis script needs to be run with sudo." \
     "\nThis install the letsencrypt client and get a certificate for" \
     "\nspecified domain and email address." \
     "\nPlease wait and follow the instructions." \
     "\n------------------------------------------------------"

git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt

/opt/letsencrypt/letsencrypt-auto certonly --standalone --email $1 -d $2

echo "Job finished."
