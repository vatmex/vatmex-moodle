FROM php:8.0-fpm-alpine

RUN apk add --no-cache libzip-dev libpng-dev icu-dev libxml2-dev

RUN docker-php-ext-install pdo pdo_mysql zip mysqli gd intl soap exif

ADD ./php/custom-php.ini /usr/local/etc/php/conf.d/custom-php.ini

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

