#!/bin/bash

cur_date () {
     date +'%Y/%m/%d %H:%M:%S' 
     }

if [ ! -f /etc/stunnel/stunnel.pem ]
then
    echo "$(cur_date) First run, generating self signed TLS certificate."
    openssl genrsa -out key.pem 4096
    openssl req -new -x509 -key key.pem -out cert.pem -days 365 -subj "/CN=go_pia_wg_transmission"
    chown stunnel:stunnel key.pem cert.pem
fi

echo "$(cur_date) Starting stunnel"

su stunnel -s /bin/ash -c "stunnel"

echo "`cur_date` Starting go_pia"

/app/go_pia