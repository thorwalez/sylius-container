Sylius Docker Container
=======================

Create at 05-03-2017

This repository includes docker images to create a docker container for
Sylius Shop Application.

>>The basic requirement is that the docker service is installed!!<<

# Repository content:
- ubuntu xenial os
- php 7.0 with mods
- composer
- apache2 with php mod
- mysql-server latest version

# Start with build the Images for the Container:
- sh start.sh

# Set a global user because the mysql root user is only available locally
- docker exec -i mysql-server mysql -uroot -proot <files/scripts/syliusRoot.sql

# After the build, start the Container:

## without project folder on the Hostsystem:
```
docker run --name test-app \
           -w /var/www/ \
           -d sylius/application/shop:latest 

docker exec -it test-app bash
```
- clone the sylius project -> git clone https://github.com/Sylius/Sylius.git project

## with project folder on the Hostsystem:
$(pwd) -> path to the project folder

```
docker run --name test-app \
           -v$(pwd)/:/var/www/project/ \
           -w /var/www/ \
           -d sylius/application/shop:latest 

 docker exec -it test-app bash
```
## copy the shell script at the project folder:
- cp syliusConfiguration.sh project/syliusConfiguration.sh 
- chown -R $user:$user project/syliusConfiguration.sh 
- chmod -R 766 project/syliusConfiguration.sh 

## switch to the user have create:
- example -> su sylius_user

## run the shell script 
- sh syliusConfiguration.sh

## Follow the instructions
  - the mysql-server ip example: 172.17.0.3
  - mysql user look at the syliusRoot.sql

In the web folder in the app_dev.php the 27 line out comment. 'The line contains 127.0.0.1'

## open the browser and enter 'example: http://172.17.0.4/app_dev.php' and you see Sylius Shop


# Example

- start.sh 

- docker exec -i mysql-server mysql -uroot -proot <files/scripts/syliusRoot.sql

- docker run --name test-app \
           -v$(pwd)/:/var/www/project/ \
           -w /var/www/ \
           -d sylius/application/shop:latest 

- docker exec -it test-app bash

- cp syliusConfiguration.sh project/syliusConfiguration.sh 

- chown -R $user:$user project/syliusConfiguration.sh 

- chmod -R 766 project/syliusConfiguration.sh 

- cd project

- su sylius_user

- sh syliusConfiguration.sh

- add ip-mysql-server, mysql-server-port, mysql-database, mysql-user, mysql-pass

- with your IDE > app_dev.php the 27 line out comment

- start your browser and enter http://ip_container_test_app/app_dev.php

Tip: you can find the Container IP with:
```
docker inspect --format '{{ .NetworkSettings.IPAddress }}' test-app

docker inspect --format '{{ .NetworkSettings.IPAddress }}' mysql-server
```
