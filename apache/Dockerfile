FROM ubuntu:20.04

# add aliases
RUN echo 'alias ll="ls -la"' >>~/.bashrc

ARG USER_ID
ARG USER_GROUP

# change www-data user and group id to host user
RUN usermod -u "${USER_ID}" www-data
RUN groupmod -g "${USER_GROUP}" www-data
RUN usermod -aG sudo www-data

# make sure to create log and change permission
RUN mkdir -p /var/log
RUN chown -R www-data:www-data /var/log

# install additional tools
RUN apt-get update -y --fix-missing
RUN apt install -y nano wget curl lynx

# add php repository
RUN apt-get install -y software-properties-common
RUN apt-get update -y --fix-missing
RUN add-apt-repository ppa:ondrej/php

# install php8.3
RUN apt-get install -y php8.3-cli php8.3-fpm php8.3-mysql php8.3-gmp php8.3-ldap php8.3-curl php8.3-intl php8.3-mbstring php8.3-xmlrpc php8.3-gd php8.3-bcmath php8.3-opcache php8.3-pdo php8.3-xml php8.3-cli php8.3-zip libapache2-mod-php8.3 libapache2-mod-fcgid
RUN apt-get update -y --fix-missing

# enable apache modules and configs
RUN a2dismod php8.3 mpm_prefork mpm_worker
RUN a2enmod mpm_event rewrite proxy proxy_fcgi setenvif headers alias fcgid actions
RUN a2enconf php8.3-fpm

RUN service apache2 restart

# start apache
EXPOSE 80

CMD ["/usr/bin/bash", "/etc/apache2/startup.sh"]
