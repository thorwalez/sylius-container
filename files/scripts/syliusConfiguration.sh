#!/bin/bash

#composer create-project sylius/sylius-standard project
git clone https://github.com/Sylius/Sylius.git .

cp ../syliusConfiguration.sh .

composer install

php bin/console sylius:install

#assets install
npm install
npm run gulp

#npm install -g yarn
#yarn install
#yarn run gulp


mkdir -p var/cache/prod/
mkdir -p var/cache/dev/
mkdir -p var/logs/

chmod -R 777 var/cache/
chmod -R 777 var/logs/
chmpd -R 777 web/media/