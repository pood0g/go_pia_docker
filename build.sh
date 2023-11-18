#!/bin/bash

## FUNCTIONS ##
cur_date () {
     date +'%Y/%m/%d %H:%M:%S' 
     }


## SCRIPT ##

if [ ! -d go_pia ]
    then
        echo "Folder doesn't exist, cloning."
        git clone https://github.com/pood0g/go_pia
        cd go_pia
    else
        echo "Folder exists, updating."
        cd go_pia
        git pull
        git reset main --hard
fi

if [ -f go.mod ]
    then
        CGO_ENABLED=0 go build --ldflags "-w -s"
        cd ..
    else
        echo "Git repo did not clone correctly."
        exit 1
fi

if [ ! -f ./key.pem ] || [ ! -f ./cert.pem ]
then
    echo "$(cur_date) cert.pem and key.pem not found, generating self signed TLS certificate."
    read -p "Enter the DNS name for the certificate: " dns_name
    openssl req -new -newkey rsa:4096 -nodes -x509 \
    -keyout key.pem -out cert.pem -days 365 \
    -subj "/CN=$dns_name" -addext "subjectAltName = DNS:$dns_name"
fi

if [ -f go_pia/go_pia ]
    then
        docker build . -t go_pia
    else
        echo "go_pia binary not found"
fi
