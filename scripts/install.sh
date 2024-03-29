#!/bin/sh

LATEST_RELEASE=$(curl https://www.mytinytodo.net/latest.php -si | grep -oP 'Location: \K.+?(?=\s)')
LATEST_VERSION=$(echo $LATEST_RELEASE | grep -oP "/download/\K.+?(?=/)")
PACKAGE_NAME="$LATEST_VERSION.tar.gz"
echo $LATEST_RELEASE
echo $LATEST_VERSION
curl -Lo $PACKAGE_NAME $LATEST_RELEASE
#mkdir -p /var/www/html/
tar xzf $PACKAGE_NAME #-C /var/www/html/
mv ./mytinytodo/* .
rm -f $PACKAGE_NAME
chmod 777 .
#cat config-sample.php | sed -e "s/Put random text here/$MTT_SALT/g" | sed -e "s/#define/define/g" > config.php
