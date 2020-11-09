FROM php:7.3-cli

RUN mkdir /app

WORKDIR /app

# Installs GD Extension.
RUN apt-get update && apt-get install -y \
        git-core \
        unzip \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr --with-jpeg-dir=/usr --with-png-dir=/usr \
    && docker-php-ext-install -j$(nproc) gd zip

# Install Composer.
COPY --from=composer /usr/bin/composer /usr/bin/composer

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /tmp

# Installs Ibis.
RUN composer global require themsaid/ibis

RUN chmod -R 777 /tmp/

ENTRYPOINT ["/tmp/vendor/bin/ibis"]

CMD ["build"]
