FROM php:apache
MAINTAINER Toan Nguyen <quoctoan.c2b@gmail.com>
COPY ./scripts /scripts
RUN chmod 777 /scripts

ARG user_id=1000
RUN usermod -u $user_id www-data
RUN usermod -G staff www-data

RUN /scripts/install.sh
RUN chown www-data:www-data /var/www/html/*

VOLUME /var/www/html/db
USER www-data

ENTRYPOINT ["/bin/sh", "/scripts/entrypoint.sh"]

WORKDIR /var/www/html
EXPOSE 80
