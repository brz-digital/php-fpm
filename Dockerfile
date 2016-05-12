FROM brzdigital/ubuntu

MAINTAINER "Joao Paulo Barbosa" <jpaulobneto@gmail.com>

RUN apt-get update -y

# Install php 7 fpm
RUN apt-get install -y \
    php7.0-fpm \
    php7.0-curl \
    php7.0-gd \
    php7.0-geoip \
    php7.0-imagick \
    php7.0-imap \
    php7.0-json \
    php7.0-ldap \
    php7.0-mcrypt \
    php7.0-memcache \
    php7.0-memcached \
    php7.0-mongo \
    php7.0-mysqlnd \
    php7.0-pgsql \
    php7.0-redis \
    php7.0-sqlite \
    php7.0-xdebug \
    php7.0-xmlrpc \
    && rm -rf /var/lib/apt/lists/*

# Configure PHP-FPM
RUN rm /etc/php/7.0/fpm/php.ini /etc/php/7.0/fpm/php-fpm.conf /etc/php/7.0/fpm/pool.d/www.conf
ADD config/php.ini /etc/php/7.0/fpm/php.ini
ADD config/php-fpm.conf /etc/php/7.0/fpm/php-fpm.conf
ADD config/www.conf /etc/php/7.0/fpm/pool.d/www.conf

VOLUME ["/var/www/html"]

EXPOSE 9000
ENTRYPOINT ["/usr/sbin/php-fpm7.0", "-F"]
