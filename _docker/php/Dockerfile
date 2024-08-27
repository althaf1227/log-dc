# FROM php:7.3-apache
FROM docker.io/bitnami/codeigniter:4

# RUN apt-get update
RUN docker-php-ext-install mysqli pdo pdo_mysql
# RUN docker-php-ext-install mysqli
# RUN apt-get install -y git
# RUN yum install zip unzip php-zip
# RUN apt-get install zip unzip
# RUN a2enmod rewrite



# RUN chmod 777 /var/www/html
WORKDIR /app/myapp



# RUN apt-get update && apt-get install -y libmcrypt-dev \
#     mysql-client libmagickwand-dev --no-install-recommends \
#     && pecl install imagick \
#     && docker-php-ext-enable imagick \
# && docker-php-ext-install mcrypt pdo_mysql
# Install Composer
# RUN curl -sS https://getcomposer.org/installer 
# RUN composer install /var/www/html/elayang/
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer require phpoffice/phpspreadsheet
RUN composer install
