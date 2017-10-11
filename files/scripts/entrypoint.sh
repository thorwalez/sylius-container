#!/usr/bin/env bash

str=$USER_ENV_ID
ext="${str//[^0-9]/}"
export USER_ENV_ID=$ext

sh /var/www/set_user_group_rights.sh

service php7.1-fpm start && /bin/bash