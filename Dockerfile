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
     

#    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
#    php -r "if (hash_file('sha384', 'composer-setup.php') === '93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
#    php composer-setup.php && \
#    php -r "unlink('composer-setup.php');" && \




