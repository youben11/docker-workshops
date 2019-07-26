# xpath-injection

It's a Django web application that was developed during INGEHACK CTF 2018 as a cyber-security challenge. It's a good start to learn how to dockerzie Django apps since you will not need to link it with any other service like a database, it uses a local sqlite db.

## Setup your environment

I'm assuming you already have Docker installed or using [Play With Docker](https://labs.play-with-docker.com/)

If you haven't already cloned this repository then please do so

```bash
$ git clone https://github.com/youben11/docker-workshops
```

You will then want to go to the folder of this workshop

```bash
$ cd docker-workshops/dockerizing_apps/xpath-injection
```

## Dockerizing

The first step you wanna do to dockerize your app is to find a base image that fits your need, then customize it (e.g installing some more deps or copying your source code). In our case we searched on the [Docker Hub](https://hub.docker.com/) and found an official image for [python](https://hub.docker.com/_/python), more precisely the one tagged with 3.6-alpine as we needed python3.6. On top of this base image, we need to install Django and another python module, those last deps also require other deps like gcc.

#### Installing the dependencies

The python:3.6-alpine is based on the alpine Linux distribution, which is a minimal distro, you will often need to install more deps on images based on alpine, you can also uses images based on other distros but it will often results in a bigger image. So here we will need to use the apk package manager of alpine to install the deps.

#### Copying the source code

Here we defined some variable that holds the target source code directory (app_path), then we will need to create that directory and put our source code there.


Let's write the Dockerfile

```bash
# This directive tells which base image we are using
# as we will only build on top of it without the need of
# installing python
FROM python:3.6-alpine
# Here we define some variable so we can reuse them in the Dockerfile
ENV app_dir_name app
ENV app_path /opt/$app_dir_name
# Here we install the deps for our app
RUN apk update
RUN apk add --virtual build-deps gcc python3-dev musl-dev libxslt-dev
RUN pip install Django
RUN pip install lxml
# This documents our image saying that
# it will have an app listening on port 8000
EXPOSE 8000
# This will just create app directory
# and put the source code there
RUN mkdir -p $app_path
COPY $app_dir_name $app_path
WORKDIR $app_path
# This defines the default command that
# will run when a container is started
# which is the app server for Django
CMD python3 manage.py runserver 0.0.0.0:8000
```

Now you need to build the image

```bash
$ docker image build --tag xpath-injection .
```

Let's run it to check

```bash
$ docker container run --detach --publish 80:8000 xpath-injection
```

Checking if it's working

```bash
$ curl -4 http://localhost
```

You just learned how to dockerize a Django app, you can continue dockerizing other technologies [here](../) or learn how to run apps with docker-compose [here](#)
