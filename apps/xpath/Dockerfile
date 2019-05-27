FROM python:3.6-alpine

ENV app_dir_name xpath
ENV app_path /opt/$app_dir_name

RUN apk update
RUN apk add --virtual build-deps gcc python3-dev musl-dev libxslt-dev

RUN pip install Django
RUN pip install lxml

EXPOSE 8000

RUN mkdir -p $app_path
COPY $app_dir_name $app_path
WORKDIR $app_path

CMD python3 manage.py runserver 0.0.0.0:8000
