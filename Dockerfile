FROM alpine:latest

RUN apk update && \
    apk upgrade && \
    apk add wireguard-tools transmission-daemon stunnel openssl&& \
    rm /usr/bin/wg-quick && \
    mkdir /app && mkdir /downloads /config && \
    chown transmission:transmission /downloads /config
COPY wg-quick /usr/bin/
COPY ca.rsa.4096.crt /app
COPY go_pia /app
COPY start_services.sh /app
WORKDIR /app
EXPOSE 9091

ENTRYPOINT [ "/app/start_services.sh" ]