#!/bin/sh
#create two directories: /var/www/ and /var/www/html
mkdir /var/www/
mkdir /var/www/html

#changes the current working directory to /var/www/html
cd /var/www/html

#removes all files and directories inside the current working directory
rm -rf *

#download the WP-CLI (WordPress Command Line Interface) tool, make it executable, and move it to /usr/local/bin/wp
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

#ses WP-CLI to download the latest WordPress core files into the current working directory. 
#The --allow-root option is used to bypass permission checks.
wp core download --allow-root

#rename the wp-config-sample.php file to wp-config.php 
#and replace it at the root (/) of the file system.
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
mv /wp-config.php /var/www/html/wp-config.php

#uses WP-CLI to install WordPress with the specified configuration options.
#The ${} variables are placeholders that will be replaced with actual values at runtime.
wp core install --allow-root --url=${DOMAIN_NAME} --title=${WORDPRESS_NAME} --admin_user=${WORDPRESS_ROOT_LOGIN} --admin_password=${MYSQL_ROOT_PASSWORD} --admin_email=${WORDPRESS_ROOT_EMAIL}

# install the Astra theme, the Redis Cache plugin, and update all installed plugins.
wp theme install astra --activate --allow-root
wp plugin install redis-cache --activate --allow-root
wp plugin update --all --allow-root

#uses the sed command to modify the PHP-FPM configuration file to use port 9000 instead of a Unix socket file.
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

#uses WP-CLI to enable Redis caching
wp redis enable --allow-root

#tarts the PHP-FPM process and runs it in the foreground.
/usr/sbin/php-fpm7.3 -F

echo "Wordpress started on :9000"