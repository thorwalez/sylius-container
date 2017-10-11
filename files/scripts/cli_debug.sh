#!/usr/bin/env bash

export XDEBUG_CONFIG="idekey=PHPSTORM" &&
export PHP_IDE_CONFIG="serverName=php" &&
php -dxdebug.remote_host=192.168.4.21 "$@"
