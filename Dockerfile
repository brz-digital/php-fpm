FROM brzdigital/ubuntu

MAINTAINER "Joao Paulo Barbosa" <jpaulobneto@gmail.com>

RUN apt-get update -y

# Install php 7 fpm
RUN apt-get install -y \
    php7.0 \
    php-fpm \
    php-curl \
    php-gd \
    php-geoip \
    php-imagick \
    php-imap \
    php-json \
    php-ldap \
    php-mcrypt \
    php-memcache \
    php-memcached \
    php-mongodb \
    php-mysqlnd \
    php-pgsql \
    php-redis \
    php-sqlite3 \
    php-xdebug \
    php-xmlrpc \
    php-intl \
    php-pear \
    php-pspell \
    php-recode \
    php-snmp \
    php-tidy \
    php-xsl \
    && rm -rf /var/lib/apt/lists/*

# Configure PHP-FPM
RUN rm /etc/php/7.0/fpm/php.ini /etc/php/7.0/fpm/php-fpm.conf /etc/php/7.0/fpm/pool.d/www.conf
ADD config/php.ini /etc/php/7.0/fpm/php.ini
ADD config/php-fpm.conf /etc/php/7.0/fpm/php-fpm.conf
ADD config/www.conf /etc/php/7.0/fpm/pool.d/www.conf

VOLUME ["/var/www/html"]

EXPOSE 9000
ENTRYPOINT ["/usr/sbin/php-fpm7.0", "-F"]
