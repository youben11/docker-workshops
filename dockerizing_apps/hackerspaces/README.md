# hackerspaces

It's a dynamic php web application that was developed during INGEHACK CTF 2018 as a cyber-security challenge. You will learn how to dockerize php apps that uses a database.

## Setup your environment

I'm assuming you already have Docker installed or using [Play With Docker](https://labs.play-with-docker.com/)

If you haven't already cloned this repository then please do so

```bash
$ git clone https://github.com/youben11/docker-workshops
```

You will then want to go to the folder of this workshop

```bash
$ cd docker-workshops/dockerizing_apps/hackerspaces
```

## Dockerizing

The first step you wanna do to dockerize your app is to find a base image that fits your need, then customize it (e.g installing some more deps or copying your source code). In our case we searched on the [Docker Hub](https://hub.docker.com/) and found an official image for [php](https://hub.docker.com/_/php), more precisely the one tagged with 7.0-apache as it contains the httpd web server that we need to serve the app. Our app need to use the mysqli php module so we will need to install it and copy the source code into the image, how to do that?

#### Copying the source code

The answer is image specific as every image documents where to put your code, in the case of the php:x.x-apache image, we need to put it under /var/www/html

#### Installing mysqli

The image repo also documents how to install php modules you will just need to run the following command

```bash
$ docker-php-ext-install module_name
```

Now that we know our needs, let's write the Dockerfile

```bash
# This directive tells which base image we are using
# as we will only build on top of without the need of
# installing php or httpd
FROM php:7.0-apache
# This will run the installation of mysqli
RUN docker-php-ext-install mysqli
# Now we copy our source code into the required directory
# to get our app running
COPY ./app/ /var/www/html/
```

Now you need to build the image

```bash
$ docker image build --tag hackerspaces .
```

Let's run it to check

```bash
$ docker container run --detach --publish 80:80 hackerspaces
```

Checking if it's working

```bash
$ curl -4 http://localhost
```

The app is now running, however, we still need to provide the database so it can work correctly, [here](../mariadb) is the workshop on how to build the database then you can follow [this one](#) on how to run them with docker-compose
