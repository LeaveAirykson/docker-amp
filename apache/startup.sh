#!/bin/bash

# set file permission for log files
chmod -R a+xrw /var/log/apache2
chown -R www-data:www-data /etc/apache2

# start fpm modules
service php8.3-fpm start

# start apache
apachectl -D FOREGROUND
