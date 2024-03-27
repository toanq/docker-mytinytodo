FROM php:apache
MAINTAINER Toan Nguyen <quoctoan.c2b@gmail.com>
COPY ./scripts /scripts

ARG user_id=1000
RUN usermod -u $user_id www-data
RUN usermod -G staff www-data

RUN /scripts/install.sh
RUN chown www-data:www-data /var/www/html/*

VOLUME /var/www/html/db
USER www-data

ENTRYPOINT ["docker-php-entrypoint"]

WORKDIR /var/www/html
EXPOSE 80
CMD ["apache2-foreground"]
