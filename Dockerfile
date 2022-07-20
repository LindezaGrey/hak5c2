FROM alpine:3.16

ARG version=3.2.0_amd64_linux

RUN apk add ca-certificates wget unzip libc6-compat \
    && wget https://downloads.hak5.org/api/devices/cloudc2/firmwares/latest --no-cache \ 
    && unzip latest \
    && mkdir /app \
    && mv c2-${version} /app/c2_community-linux-64 \
    && rm c2*  \
    && chmod +x /app/* \
    && apk del wget unzip

COPY run.sh /app

EXPOSE 8080 2022

CMD /bin/ash /app/run.sh
