#!/bin/sh
cd /var/www/app
sudo -u nginx php admin/cli/upgrade.php --allow-unstable --non-interactive || true
cron
nginx -g 'daemon off;' &
P1=$!
php-fpm8.3 &
P2=$! &
wait $P1 $P2
