FROM alpine:3.10

ARG version=2.1.2

RUN apk add ca-certificates wget unzip libc6-compat \
    && wget https://downloads.hak5.org/api/devices/cloudc2-community/firmwares/${version} --no-cache \ 
    && unzip ${version} \
    && mkdir /app \
    && mv c2_community-linux-64 /app \
    && rm c2* ${version} \
    && chmod +x /app/* \
    && apk del wget unzip

COPY run.sh /app

EXPOSE 8080 2022

CMD /bin/ash /app/run.sh