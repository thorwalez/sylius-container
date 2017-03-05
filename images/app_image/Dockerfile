FROM sylius/plugin/apache:latest

MAINTAINER Mike Hartl <mike_hartl@gmx.de>

#Application area
RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mysql-client \
                       unzip \
                       git \
                       phpunit \
                       curl
RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y npm nodejs-legacy

RUN a2enmod rewrite
RUN a2dismod mpm_event
RUN a2enmod php7.0

ADD ./files/etc/apache2/sites-available/default.conf /etc/apache2/sites-available/000-default.conf
ADD ./files/etc/php/apache2/php.ini /etc/php/7.0/apache2/php.ini
ADD ./files/etc/php/cli/php.ini /etc/php/7.0/cli/php.ini

ADD ./files/scripts/syliusConfiguration.sh /var/www/syliusConfiguration.sh

#composer install
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

WORKDIR /var/www/