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
