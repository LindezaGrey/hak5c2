FROM debian:stable-slim

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates wget unzip && rm -rf /var/lib/apt/lists/*
RUN wget https://downloads.hak5.org/api/devices/cloudc2-community/firmwares/2.0.0 && unzip 2.0.0
RUN export DEBIAN_FRONTEND=noninteractive
RUN mkdir /app && mv c2_community-linux-64 /app && rm c2* 2.0.0
COPY run.sh /app
RUN chmod +x /app/c2_community-linux-64
RUN chmod +x /app/run.sh
EXPOSE 8080 2022

CMD /bin/bash /app/run.sh