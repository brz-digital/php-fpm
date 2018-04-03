FROM brzdigital/ubuntu

MAINTAINER "Joao Paulo Barbosa" <jpaulobneto@gmail.com>

RUN apt-get update -y

# Install php 7 fpm
RUN apt-get install -y \
    php7.2-fpm \
    php7.2-curl \
    php7.2-gd \
    php7.2-geoip \
    php7.2-imagick \
    php7.2-imap \
    php7.2-json \
    php7.2-ldap \
    php7.2-mcrypt \
    php7.2-memcache \
    php7.2-memcached \
    php7.2-mongo \
    php7.2-mysqlnd \
    php7.2-pgsql \
    php7.2-redis \
    php7.2-sqlite \
    php7.2-mbstring \
    php7.2-xdebug \
    php7.2-xml \
    php7.2-xmlrpc \
    php7.2-zip \
    php7.2-intl \
    && rm -rf /var/lib/apt/lists/*

# Configure PHP-FPM
RUN rm /etc/php/7.2/fpm/php.ini /etc/php/7.2/fpm/php-fpm.conf /etc/php/7.2/fpm/pool.d/www.conf
ADD config/php.ini /etc/php/7.2/fpm/php.ini
ADD config/php-fpm.conf /etc/php/7.2/fpm/php-fpm.conf
ADD config/www.conf /etc/php/7.2/fpm/pool.d/www.conf

VOLUME ["/var/www/html"]

EXPOSE 9000
ENTRYPOINT ["/usr/sbin/php-fpm7.2", "-F"]
