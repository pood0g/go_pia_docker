FROM alpine:latest

RUN apk update && \
    apk upgrade && \
    apk add wireguard-tools transmission-daemon stunnel openssl&& \
    rm /usr/bin/wg-quick /etc/stunnel/stunnel.conf && \
    mkdir /app /downloads /config && \
    chown transmission:transmission /downloads /config
COPY wg-quick /usr/bin/
COPY ca.rsa.4096.crt /app
COPY go_pia /app
COPY start_services.sh /app
COPY stunnel.conf /etc/stunnel
COPY settings.json /config
RUN chown transmission:transmission /config/settings.json
WORKDIR /app
EXPOSE 9092

ENTRYPOINT [ "/app/start_services.sh" ]