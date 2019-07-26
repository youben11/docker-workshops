# This directive tells which base image we are using
# as we will only build on top of without the need of
# installing php or httpd
FROM php:7.0-apache
# This will run the installation of mysqli
RUN docker-php-ext-install mysqli
# Now we copy our source code into the required directory
# to get our app running
COPY ./app/ /var/www/html/
