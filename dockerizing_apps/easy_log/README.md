# easy_log

It's a static php web application that was developed during INGEHACK CTF 2018 as a cyber-security challenge. It's a good start to learn how to dockerzie php apps since you will not need to link it with any other service like a database.

## Setup your environment

I'm assuming you already have Docker installed or using [Play With Docker](https://labs.play-with-docker.com/)

If you haven't already cloned this repository then please do so

```bash
$ git clone https://github.com/youben11/docker-workshops
```

You will then want to go to the folder of this workshop

```bash
$ cd docker-workshops/dockerizing_apps/easy_log
```

## Dockerizing

The first step you wanna do to dockerize your app is to find a base image that fits your need, then customize it (e.g installing some more deps or copying your source code). In our case we searched on the [Docker Hub](https://hub.docker.com/) and found an official image for [php](https://hub.docker.com/_/php), more precisely the one tagged with 7.0-apache as it contains the httpd web server that we need to server the app. Now we don't need to install any more deps for our app but we still need to copy the source code into the image, how to do that?

The answer is image specific as every image documents where to put your code, in the case of the php:x.x-apache image, we need to put it under /var/www/html, now we can start writing our Dockerfile

```bash
# This directive tells which base image we are using
# as we will only build on top of without the need of
# installing php or httpd
FROM php:7.0-apache
# Now we copy our source code into the required directory
# to get our app running
COPY ./app/ /var/www/html/
```

Now you need to build the image

```bash
$ docker image build -t easylog .
```

You now have a ready to use web app that you can run anywhere! Let's run it

```bash
$ docker container run -d -p 80:80 easylog
```

Checking if it's working

```bash
$ curl -4 http://localhost
```
