# This directive tells which base image we are using
# as we will only build on top of it without the need
# of installing more deps
FROM mariadb:latest
# Here we copy our init sql script so that they got
# executed on the startup of the container
COPY db_scripts /docker-entrypoint-initdb.d
