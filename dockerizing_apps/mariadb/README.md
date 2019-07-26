# mariadb

When using databases for web apps, we often need to do some initialization like creating databases and tables. When we use databases as containers, we want this initialization to be present at every start of our container without the need to repeat it each time. Here we will create a mariadb image with init scripts for the [hackerspaces](/hackerspaces) app.

## Setup your environment

I'm assuming you already have Docker installed or using [Play With Docker](https://labs.play-with-docker.com/)

If you haven't already cloned this repository then please do so

```bash
$ git clone https://github.com/youben11/docker-workshops
```

You will then want to go to the folder of this workshop

```bash
$ cd docker-workshops/dockerizing_apps/mariadb
```

## Dockerizing

A simple search on the [Docker Hub](https://hub.docker.com/) reveals the official mariadb image, you can read its documentation to learn more about how to use it. Here we only need the initialization feature.

#### Initialization

From the docs, to initialize the db on startup, you just need to put sql scripts under /docker-entrypoint-initdb.d, so any sql script there will be executed on startup letting us create databases and tables for our apps.

Let's construct the Dockerfile

```bash
# This directive tells which base image we are using
# as we will only build on top of it without the need
# of installing more deps
FROM mariadb:latest
# Here we copy our init sql script so that they got
# executed on the startup of the container
COPY db_scripts /docker-entrypoint-initdb.d
```

Now we need to built the image

```bash
$ docker image build --tag mydb .
```

Let's now run it

```bash
$ docker container run --detach mydb
```

Checking if it's running

```bash
$ docker container ls
```

You learned how to create your own db image with init scripts, you can now jump to use this db with its [associated web app](../hackerspaces), learn how to deploy them together [here](#).
