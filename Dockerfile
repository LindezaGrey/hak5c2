FROM alpine:3.10

RUN apk add ca-certificates wget unzip libc6-compat \
    && wget https://downloads.hak5.org/api/devices/cloudc2-community/firmwares/2.1.0 --no-cache \ 
    && unzip 2.1.0 \
    && mkdir /app \
    && mv c2_community-linux-64 /app \
    && rm c2* 2.1.0 \
    && chmod +x /app/* \
    && apk del wget unzip

COPY run.sh /app

EXPOSE 8080 2022

CMD /bin/ash /app/run.sh