#!/bin/bash

#git clone https://github.com/Sylius/Sylius.git project

#cp syliusConfiguration.sh project/syliusConfiguration.sh 
#chown -R $user:$user project/syliusConfiguration.sh 
#chmod -R 766 project/syliusConfiguration.sh 

#cd project/


composer install

php bin/console sylius:install

#assets install
npm install 
npm run gulp


mkdir -p var/cache/prod/
mkdir -p var/cache/dev/
mkdir -p var/logs/

chmod -R 777 var/cache/
chmod -R 777 var/logs/
