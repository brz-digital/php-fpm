FROM brzdigital/ubuntu

MAINTAINER "Joao Paulo Barbosa" <jpaulobneto@gmail.com>

RUN apt-get update -y

# Install php 7 fpm
RUN apt-get install -y \
    php7.1-fpm \
    php7.1-curl \
    php7.1-gd \
    php7.1-geoip \
    php7.1-imagick \
    php7.1-imap \
    php7.1-json \
    php7.1-ldap \
    php7.1-mcrypt \
    php7.1-memcache \
    php7.1-memcached \
    php7.1-mongo \
    php7.1-mysqlnd \
    php7.1-pgsql \
    php7.1-redis \
    php7.1-sqlite \
    php7.1-mbstring \
    php7.1-xdebug \
    php7.1-xml \
    php7.1-xmlrpc \
    php7.1-zip \
    && rm -rf /var/lib/apt/lists/*

# Configure PHP-FPM
RUN rm /etc/php/7.1/fpm/php.ini /etc/php/7.1/fpm/php-fpm.conf /etc/php/7.1/fpm/pool.d/www.conf
ADD config/php.ini /etc/php/7.1/fpm/php.ini
ADD config/php-fpm.conf /etc/php/7.1/fpm/php-fpm.conf
ADD config/www.conf /etc/php/7.1/fpm/pool.d/www.conf

VOLUME ["/var/www/html"]

EXPOSE 9000
ENTRYPOINT ["/usr/sbin/php-fpm7.1", "-F"]
