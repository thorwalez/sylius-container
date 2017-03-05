#!/bin/bash

docker run --name mysql-server -e MYSQL_ROOT_PASSWORD=root -d mysql/mysql-server:latest

docker build -t sylius/os/ubunut:xenial --build-arg USER_NAME=$USER --build-arg USER_ID=$(id -u) -f images/basic_image/Dockerfile .

docker build -t sylius/plugin/php:latest -f images/php_image/Dockerfile .

docker build -t sylius/plugin/apache:latest -f images/apache_image/Dockerfile .

docker build -t sylius/application/shop:latest -f images/app_image/Dockerfile .

echo 'docker exec -i mysql-server mysql -uroot -proot < files/scripts/syliusRoot.sql'

echo 'docker run --name test-app -v$(pwd)/:/var/www/project/ -w /var/www/project/ -d sylius/application/shop:latest && docker exec -it test-app bash'