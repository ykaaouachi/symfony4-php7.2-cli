FROM php:7.2-cli

LABEL Version="1.0" \
      Maintainer="Youssef K <ykaaouachi@gmail.com>" \
      Description="Image based on php:7.2-cli image adapted for symfony 4 needs"


RUN apt-get update -yqq && \
    apt-get install git -yqq zlib1g-dev unzip wget && \
    # Install mysql driver
    docker-php-ext-install pdo_mysql zip 

# Install composer
COPY bin/composer.sh /opt/bin/composer-install.sh
RUN  chmod +x /opt/bin/composer-install.sh && \
     ./opt/bin/composer-install.sh && \
    # make it global
    mv composer.phar /usr/local/bin/composer
