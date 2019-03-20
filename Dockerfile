FROM php:5-apache
MAINTAINER David Tabarie "david.tabarie@gmail.com"
COPY ./www/ /var/www/html
USER root
RUN docker-php-ext-install mysqli
RUN chmod -R 777 /var/www/html/uploads
