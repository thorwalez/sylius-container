FROM ubuntu:xenial

MAINTAINER Mike Hartl <mike_hartl@gmx.de>

ENV TERM=xterm

# update the os system
RUN apt-get update 
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y

RUN apt-get install -y ppa-purge

RUN apt-get install -y software-properties-common python-software-properties

#USER AREA
ARG USER_NAME
ENV USER_ENV_NAME=$USER_NAME
ARG USER_ID

RUN adduser $USER_NAME --uid $USER_ID --disabled-password
RUN usermod -aG www-data $USER_NAME
RUN usermod -aG root $USER_NAME
#delete the pass from user
RUN passwd -d $USER_NAME
