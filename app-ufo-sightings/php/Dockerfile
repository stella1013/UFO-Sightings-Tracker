FROM php:7.4-fpm-alpine

RUN docker-php-ext-install opcache pdo pdo_mysql

COPY ./data/* /var/www/html/

WORKDIR /var/www/html

#comment in for deployment... might need to uncomment regardless
#COPY src .

#RUN docker-php-ext-install pdo pdo_mysql

#comment in for deployment
#RUN chown -R www-data:www-data /var/www/html