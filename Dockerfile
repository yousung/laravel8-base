FROM php:7.4-fpm-alpine3.12

LABEL MAINTAINER="nug22kr <nug22kr@gmail.com>"
LABEL PHP="7.4"
LABEL BASE_FRAMEWORK="Laravel 8"

WORKDIR /var/www

# Install
RUN apk add --update --no-cache \
    build-base \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libzip-dev \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    oniguruma-dev \
    curl \
    autoconf \
    libmcrypt-dev \
    libxml2-dev \
    libsodium \
    gd-dev \
    supervisor \

  # Redis install
  && pecl install -o -f redis \
  &&  rm -rf /tmp/pear \
  &&  docker-php-ext-enable redis opcache && apk del autoconf \

  # extend install
  && docker-php-ext-install bcmath ctype fileinfo json mysqli pdo pdo_mysql tokenizer xml opcache \
  && docker-php-ext-configure opcache --enable-opcache \
  && docker-php-ext-configure gd --with-jpeg=/usr/include/ --with-freetype=/usr/include/ \
  && docker-php-ext-configure zip \

  #  Clean
  && rm -rf /var/cache/apk/* \
  && docker-php-source delete
