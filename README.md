# traefik-example

Aim of this repository is to describe and test how to connect multiple containers under traefik.

# Setup

```
git clone git@github.com:cbspire/traefik-example.git && cd traefik-example
docker-compose build --no-cache
sudo ./set-hosts.sh
docker-compose up -d
```

## Traefik

Traekif is exposed on :80 port and you can check the dasbhaord at http://localhost:8080.

2 docker contaienrs are exposed to

- http://h1.local
- http://h2.local

## Usage

Login into one of the 2 available container2 via docker and test the HTTP call to the other container

```
docker-compose exec -it h1 bash
curl h2
```

Output must be
```
Hello h2
```


# Next steps: make curl available if possible also for

````
docker-compose exec -it h1 bash
curl http://h2.local
