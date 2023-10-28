#!/bin/bash

cur_date () {
     date +'%Y/%m/%d %H:%M:%S' 
     }

if [ ! -f ./key.pem ] || [ ! -f ./cert.pem ]
then
    echo "$(cur_date) First run, generating self signed TLS certificate."
    openssl req -new -newkey rsa:4096 -nodes -x509 -keyout key.pem -out cert.pem -days 365 -subj "/CN=go_pia_docker"
    chown stunnel:stunnel key.pem cert.pem
fi

echo "`cur_date` Starting go_pia"

/app/go_pia