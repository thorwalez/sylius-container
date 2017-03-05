FROM sylius/plugin/php:latest

MAINTAINER Mike Hartl <mike_hartl@gmx.de>

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y apache2 

ADD ./files/etc/apache2/sites-available/default.conf /etc/apache2/sites-available/000-default.conf

RUN a2dismod mpm_event

RUN a2enmod php7.0

CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["apachectl"]