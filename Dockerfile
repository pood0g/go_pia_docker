FROM alpine

RUN apk update && \
    apk upgrade && \
    apk add wireguard-tools transmission-daemon stunnel openssl libuser shadow && \
    rm /usr/bin/wg-quick /etc/stunnel/stunnel.conf && \
    mkdir /app /downloads /config /etc/default && \
    ln -s /usr/bin/luseradd /etc/default/useradd
COPY wg-quick /usr/bin/
COPY ca.rsa.4096.crt /app
COPY start_services.sh /app
COPY stunnel.conf /etc/stunnel
COPY settings.json /config
COPY go_pia/go_pia /app
COPY cert.pem /app
COPY key.pem /app
WORKDIR /app
EXPOSE 9091

ENTRYPOINT [ "/app/start_services.sh" ]
