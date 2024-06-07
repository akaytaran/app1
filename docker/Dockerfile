FROM php:8.2-fpm
ARG ARCH=amd64
RUN apt-get update --fix-missing
RUN apt-get install -y curl
RUN apt-get install -y build-essential libssl-dev zlib1g-dev libpng-dev libjpeg-dev libfreetype6-dev git libzip-dev zip unzip wget
RUN apt-get install -y libmagickwand-dev --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN printf "\n" | pecl install imagick
RUN docker-php-ext-enable imagick

RUN docker-php-ext-install pdo pdo_mysql exif bcmath zip xml

RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
    && docker-php-ext-install gd

RUN apt-get update --fix-missing && \
    apt-get -y install sudo

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN sed -ri 's/^www-data:x:33:33:/www-data:x:1000:50:/' /etc/passwd

RUN apt-get update && apt-get -y install fontconfig libxext6 libxrender1 xfonts-utils wget libfontenc1 x11-common xfonts-75dpi xfonts-base
RUN curl -L -o /tmp/wkhtmltopdf.deb "https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.stretch_${ARCH}.deb"
RUN dpkg -i --force-depends --force-architecture /tmp/wkhtmltopdf.deb