FROM brzdigital/ubuntu

MAINTAINER "Hugo Fabricio" <hugo@brzdigital.com.br>

RUN apt-get update -y

# Install php 7 fpm
RUN apt-get install -y php7.2-cli \
    php7.2-fpm \
    php7.2-bcmath \
    php7.2-common \
    php7.2-bz2 \
    php7.2-calendar \
    php7.2-iconv \
    php7.2-igbinary \
    php7.2-cgi \
    php7.2-curl \
    php7.2-dev \
    php7.2-fpm \
    php7.2-gd \
    php7.2-intl \
    php7.2-json \
    php7.2-mysql \
    php7.2-mbstring \
    php7.2-pgsql \
    php7.2-sqlite3 \
    php7.2-xml \
    php7.2-zip \
    php7.2-geoip \
    php7.2-imap \
    php7.2-ldap \
    php7.2-memcache \
    php7.2-mongo \
    php7.2-mysqlnd \
    php7.2-xdebug \
    php7.2-xmlrpc \
    php-apcu \
    php-imagick \
    php-memcached \
    php-redis \
    && rm -rf /var/lib/apt/lists/*

# Configure PHP-FPM
RUN rm /etc/php/7.2/fpm/php.ini /etc/php/7.2/fpm/php-fpm.conf /etc/php/7.2/fpm/pool.d/www.conf
ADD config/php.ini /etc/php/7.2/fpm/php.ini
ADD config/php-fpm.conf /etc/php/7.2/fpm/php-fpm.conf
ADD config/www.conf /etc/php/7.2/fpm/pool.d/www.conf

VOLUME ["/var/www/html"]

EXPOSE 9000
ENTRYPOINT ["/usr/sbin/php-fpm7.2", "-F"]
