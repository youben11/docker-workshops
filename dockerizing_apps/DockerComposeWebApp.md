# Running hackerspaces and its db using docker-compose

Here we will start the hackerspaces web app along with its db using docker-compose.

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

## Writing the docker-compose.yml

docker-compose will let you run multiple services in a single Docker node easily, it also let you scale your app to multiple replicas and many other features.

Here we want to run two services, the first is the hackerspaces web app, the second is a database that's gonna be used by the web app.

A docker-compose file is written in yaml format, a simple and human readable format, just take a look at our docker-compose and try to guess what's going on without reading comments

```yaml
version: '3'

services:
  # The services that docker-compose should take care of

  hackerspaces: # The name of the service
    # The image to be used for this service
    image: hackerspaces
    # The build directory used to build the image
    # if it's not found or explicitly told to
    build: ./hackerspaces
    # ports to be published on the host
    # (port_in_host:port_in_container)
    ports:
            - "80:80"
    # Since this service depends on mariadb
    # mariadb will be started first
    depends_on:
            - mariadb

  mariadb:
    image: db
    build: ./mariadb
    # Environment variable to be set on startup, the mariadb
    # image needs this one to setup the root password
    environment:
            - MYSQL_ROOT_PASSWORD=blackxor
```

Once we have this file ready, we will only need to run a simple command to get our two services running

```bash
$ docker-compose up -d
```

Check your app now

```bash
$ curl -4 http://127.0.0.1
```

No need to remember any of the parameters to pass when starting your containers now!
