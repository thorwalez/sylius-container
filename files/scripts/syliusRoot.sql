CREATE USER 'operator'@'%' IDENTIFIED BY 'operator123';
grant all privileges on *.* to 'operator'@'%' with grant option;
FLUSH PRIVILEGES;
