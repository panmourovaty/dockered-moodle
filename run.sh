#!/bin/sh
cd /var/www/app
sudo -u nginx php admin/cli/upgrade.php --allow-unstable --non-interactive || true
nginx -g 'daemon off;' &
P1=$!
php-fpm8.0 &
P2=$!
wait $P1 $P2
