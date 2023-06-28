#!/bin/bash

if [ ! -f /etc/stunnel/stunnel.pem ]
then
    echo "[+] Generating self signed TLS certificate."
    openssl genrsa -out key.pem 4096
    openssl req -new -x509 -key key.pem -out cert.pem -days 365
    chown stunnel:stunnel key.pem cert.pem
fi

echo "[+] Starting stunnel"

su stunnel -s /bin/ash -c "stunnel"

echo "[+] Starting transmission-daemon"

su transmission -s /bin/ash -c "transmission-daemon --config-dir /config"

echo "[+] Starting go_pia"

/app/go_pia