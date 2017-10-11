FROM server/php-fpm/sylius:latest

LABEL maintainer="mike_hartl@gmx.de"

ENV TERM=xterm

ENV LANGUAGE de_DE:de
ENV LC_ALL de_DE.UTF-8

RUN apt-get update

# Currently required app
RUN apt-get install -y curl \
                       git \
                       sudo \
                       zip \
                       mysql-client \
                       phpunit \
                       unzip

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y npm nodejs-legacy

# Currently required php modules
RUN apt-get install -y \
                    php7.1-intl \
                    php7.1-cli \
                    php7.1-curl \
                    php7.1-mbstring \
                    php7.1-mysql \
                    php7.1-mcrypt \
                    php7.1-bcmath \
                    php7.1-xml \
                    php7.1-common \
                    php7.1-gd \
                    php7.1-xsl \
                    php7.1-zip \
                    php7.1-iconv \
                    php7.1-xdebug \
                    php7.1-imagick \
                    php7.1-apcu \
                    php-soap \
                    php-ssh2


COPY ./files/scripts/syliusConfiguration.sh /var/www/syliusConfiguration.sh

COPY ./files/etc/php/apache2/php.ini /etc/php/7.1/apache2/php.ini
COPY ./files/etc/php/cli/php.ini /etc/php/7.1/cli/php.ini

# xdebug configuration
COPY ./files/etc/php/mods-available/xdebug.ini /etc/php/7.1/mods-available/xdebug.ini
COPY ./files/etc/php/mods-available/xdebug.ini /etc/php/7.1/cli/conf.d/20-xdebug.ini
COPY ./files/etc/php/mods-available/xdebug.ini /etc/php/7.1/fpm/conf.d/20-xdebug.ini
## Script to xdebug cli script in the container
COPY ./files/scripts/cli_debug.sh /var/www/cli_debug.sh


# install composer default
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer;
RUN chmod 777 /usr/local/bin/composer

# Script to create a developer in the container
COPY ./files/scripts/set_user_group_rights.sh /var/www/set_user_group_rights.sh
RUN chmod 777 /var/www/set_user_group_rights.sh
# entrypoint script
COPY ./files/scripts/entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh

WORKDIR /var/www/app

RUN update-rc.d php7.1-fpm defaults

ENTRYPOINT ["/entrypoint.sh"]
