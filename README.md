# traefik-example

Aim of this repository is to describe and test how to connectand reach containers under traefik

## Use cases
[x] internal HTTP with local name
[x] internal SSH
[] using with code-server via web (require local HTTPS)
[] http with traefik host

# Setup

```
git clone git@github.com:cbspire/traefik-example.git && cd traefik-example
docker-compose build --no-cache
sudo ./set-hosts.sh
docker-compose up -d
```

## Exposed hosts
- http://code.local
- http://h1.local
- http://h2.local

## SSH access
Username: user
Password: password

# Internal HTTP with local name
Login into one of the 2 available container via docker and test the HTTP call to the other container

```
docker-compose exec -it h1 bash
curl h2
```

Output must be
```
Hello from h2
```

# Internal SSH with local name
Login into one of the 2 available container via docker and test the SSH call to the other container

```
docker-compose exec -it h1 bash
ssh user@h2
```

Output must be
```
Hello from h2
```
