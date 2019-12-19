![Docker Pulls](https://img.shields.io/docker/pulls/lindezagrey/hak5c2?style=plastic)

# 🐋 Alpine based hak5c² container

This image packs the amazing Hak5C² software into a secure and light weight alpine-linux based docker container.

Quick start for local tests (assuming your local ip is 192.168.1.1):

```sh
docker volume create c2DB
docker run -d -p 8080:8080 -p 2022:2022 -e db=/home/c2.db -v c2DB:/home --name hak5c2 --hostname=192.168.1.1 lindezagrey/hak5c2
```

## Build options

You can build the image by yourself with any of the provided docker compose files or with the docker build command. This will download the software and build the image.

* Clone or download this repository
* either build the image with ```docker build --rm -f "Dockerfile" -t hak5c2 .```
* or if you use docker compose ```docker-compose -f "docker-compose.yml" up -d --build```

Or for a quickstart you can use a prepared image from [Dockerhub](https://hub.docker.com/r/lindezagrey/hak5c2) which is based on this repository.

## Deployment options

You can run the image directly with docker or with docker-compose (check the [examples](/examples) folder). It is possible to run the container without a volume, which means everything that is stored in C² is lost when the container is removed (including loot and licensing). On the other hand you can create a volume and map it so that the c2.db is persistent.

The easiest way to run a container locally (assuming you build it yourself) would be:

```sh
docker run -d --name hak5c2 hak5c2
```

Then you will be able to access the webinterface by navigating to localhost:8080.
To get the setup token you can run:

```sh
docker logs hak5c2 | grep "token"
```

If you want to run it externally accessible (e.g. on a VPS) you have to publish the ports 8080 and 2022 as well.
The application will take the hostname of the container as the hostname argument. So if you made a DNS entry use the FQDN as hostname, if not then the public IP of your server.

```sh
docker run -d -p 8080:8080 -p 2022:2022 --name hak5c2 --hostname=test.test.com hak5c2
```

## Environment variables

You can pass all parameters you would normally pass to the application to the container by adding them as an environment variable (except the hostname which is set by the docker "hostname" command):

```sh
docker run -d -e reverseProxy=True -e reverseProxyPort=443 --name hak5c2 hak5c2
```

```sh
Usage of ./c2_community-linux-64:
 -certFile string
    Custom SSL Certificate file (disabled letsencrypt)
 -db string
    Path to the c2 database (default "c2.db")
 -https True/False
    Enable https (requires ports 80 and 443)
 -keyFile string
    Custom SSL Key file (disables letsencrypt)
 -listenip string
    IP address to listen on (default "0.0.0.0")
 -listenport string
    Port of the HTTP server (default "8080")
 -reverseProxy True/False
    If set, Cloud C2 will work behind a reverse proxy
 -reverseProxyPort string
    If set, this will be the internet facing port from which Cloud C2 will be available
 -sshport string
    Port of the SSH server (default "2022")
```
