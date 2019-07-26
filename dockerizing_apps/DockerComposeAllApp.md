# Running all the apps using docker-compose

Here we will start all the app dockerized so far using docker-compose.

## Setup your environment

I'm assuming you already have Docker installed or using [Play With Docker](https://labs.play-with-docker.com/)

If you haven't already cloned this repository then please do so

```bash
$ git clone https://github.com/youben11/docker-workshops
```

You will then want to go to the folder of this workshop

```bash
$ cd docker-workshops/dockerizing_apps
```

## Writing the docker-compose-all-apps.yml

docker-compose will let you run multiple services in a single Docker node easily, it also let you scale your app to multiple replicas and many other features.

Here we want to run 4 services, 3 web app and 1 database.

A docker-compose file is written in yaml format, a simple and human readable format, just take a look at our docker-compose and try to guess what's going on without reading comments

```yaml
version: '3'

services:
  # The services that docker-compose should take care of
  xpathinj: # The name of the service
    # The image to be used for this service
    image: xpath-injection
    # The build directory used to build the image
    # if it's not found or explicitly told to
    build: ./xpath-injection
    # ports to be published on the host
    # (port_in_host:port_in_container)
    ports:
      - "9000:8000"
    # Networks are used to isolate containers.
    # Putting two containers inside the same network
    # mean they communicate, otherwise they can't
    networks:
      xpathinj:

  hackerspaces:
    image: hackerspaces
    build: ./hackerspaces
    ports:
      - "9002:80"
    # Since this service depends on mariadb
    # mariadb will be started first
    depends_on:
      - mariadb
    networks:
      hackerspaces:

  easy_log:
    image: easy_log
    build: ./easy_log
    ports:
      - "9004:80"
    networks:
      easy_log:

  mariadb:
    image: db
    build: ./mariadb
    # Environment variable to be set on startup, the mariadb
    # image needs this one to setup the root password
    environment:
      - MYSQL_ROOT_PASSWORD=blackxor
    networks:
      hackerspaces:

# The list of networks used by those services
networks:
  xpathinj:
  hackerspaces:
  easy_log:
```

Once we have this file ready, we will only need to run a simple command to get our two services running

```bash
$ docker-compose -f docker-compose-all-apps.yml up -d
```

You can check each app on it's specific port.

It doesn't matter how much services you have to manage, you will only need to write the docker-compose file once!
