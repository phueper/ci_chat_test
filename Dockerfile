FROM php:7-apache
RUN apt-get update \
    && apt-get install -y \
                   ssl-cert \
                   libfreetype6-dev \
                   mysql-client \
                   openssh-client \
                   rsync \
                   vim \
                   less \
                   git \
                   zip \
    && docker-php-ext-install -j$(nproc) mysqli

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

EXPOSE 443

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

# this is only needed for local lingner-gold
COPY ./docker/php_tz.ini /usr/local/etc/php/conf.d/
COPY ./docker/docker-ssl.conf /etc/apache2/sites-available
COPY ./docker/loglevel.conf /etc/apache2/conf-available
COPY ./docker/codeigniter-docroot.conf /etc/apache2/conf-available
RUN a2ensite docker-ssl \
    a2dissite 000-default \
    && a2enmod rewrite ssl \
    && a2enconf loglevel \
    && a2enconf codeigniter-docroot
COPY . /var/www/codeigniter/
WORKDIR /var/www/codeigniter
RUN mkdir ./system/cache \
    && chmod a+rwx ./system/cache

# we cannot run scripts on build since db is not available!
RUN composer install --prefer-source --no-interaction --no-scripts
