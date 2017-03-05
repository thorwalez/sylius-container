FROM sylius/os/ubunut:xenial

MAINTAINER Mike Hartl <mike_hartl@gmx.de>

RUN apt-get update && apt-get upgrade -y

RUN apt-get dist-upgrade -y

RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php

RUN apt-get update

RUN apt-get install -y --no-install-recommends php7.0 \
                       php7.0-common \
                       php7.0-gd \
                       php7.0-mysql \
                       php7.0-mcrypt \
                       php7.0-curl \
                       php7.0-intl \
                       php7.0-xsl \
                       php7.0-mbstring \
                       php7.0-zip \
                       php7.0-bcmath \
                       php7.0-iconv \
                       php7.0-xdebug \
                       libapache2-mod-php7.0

ADD ./files/etc/php/cli/php.ini /etc/php/7.0/cli/php.ini
ADD ./files/etc/php/apache2/php.ini /etc/php/7.0/apache2/php.ini