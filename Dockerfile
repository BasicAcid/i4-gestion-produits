FROM php:5-apache
MAINTAINER David Tabarie "david.tabarie@gmail.com"

COPY ./www/ /var/www/html

RUN apt update && apt -y upgrade && apt -y install git zip

RUN docker-php-ext-install mysqli

# Install Composer as showed here (this is not the best way, as the hash will change over time): https://getcomposer.org/download/
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"

RUN mv composer.phar /usr/local/bin/composer

RUN composer require aws/aws-sdk-php

RUN chmod -R 777 /var/www/html/uploads

EXPOSE 80
