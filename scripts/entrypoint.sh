#!/bin/sh
echo App start...
cat config-sample.php | sed -e "s/Put random text here/$MTT_SALT/g" | sed -e "s/#define/define/g" > config.php
docker-php-entrypoint apache2-foreground
