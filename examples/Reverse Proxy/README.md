# Reverse Proxy example

This compose file is an example of how to use the image together with a docker based nginx reverse proxy, namely [jwilder/nginx-proxy
](https://github.com/jwilder/nginx-proxy) with the  [JrCs / docker-letsencrypt-nginx-proxy-companion](https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion)

To run, adapt the file with your domain and run:

```sh
docker-compose -f "examples/Reverse Proxy/docker-compose.yml" up -d --build
```
