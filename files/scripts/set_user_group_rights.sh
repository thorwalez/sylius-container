#!/usr/bin/env bash
password=123
#sudo -i
#echo "$USER_ENV_NAME    ALL=(ALL:ALL) ALL" >> /etc/sudoers;
#echo "$USER_ENV_NAME    ALL=(ALL:ALL) apt-get" >> /etc/sudoers;


adduser $USER_ENV_NAME --uid $USER_ENV_ID --disabled-password --gecos ""
usermod -aG www-data $USER_ENV_NAME
usermod -aG www-data $USER_ENV_NAME
usermod -aG root $USER_ENV_NAME
usermod -aG sudo $USER_ENV_NAME
#passwd -d $USER_ENV_NAME
#gpasswd -r $USER_ENV_NAME

chown -R $USER_ENV_NAME:$USER_ENV_NAME /home/$USER_ENV_NAME/

chpasswd << EOT
$USER_ENV_NAME:${password}
EOT

