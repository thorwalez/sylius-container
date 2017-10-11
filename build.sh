#!/bin/bash

docker build -t server/nginx/sylius:latest -f ./images/Dockerfile.nginx .
#docker build -t hub.hc-fcad.de/server/apache/sylius:latest -f ./images/Dockerfile.apache .
#docker build -t hub.hc-fcad.de/server/mysql/sylius:latest -f ./images/Dockerfile.mysql .
docker build -t server/php-fpm/sylius:latest -f ./images/Dockerfile.php-fpm .
docker build -t server/app/sylius:latest -f ./images/Dockerfile.app .

echo 'docker exec -i mysql-server mysql -uroot -proot < files/scripts/syliusRoot.sql'

echo 'docker run --name test-app -v$(pwd)/:/var/www/project/ -w /var/www/project/ -d sylius/application/shop:latest && docker exec -it test-app bash'