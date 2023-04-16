#!/bin/sh
#checks if WordPress core is installed by running the wp core is-installed command with the specified 
#path to the WordPress installation directory. If it's not installed, the following commands are executed
if ! wp core is-installed --allow-root --path=/var/www/wordpress; then
	#downloads WordPress core files to the specified path
	wp core download --path=/var/www/html --allow-root
	#Import env variables in the config file
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	#creates a copy of the wp-config-sample.php file and renames it to wp-config.php
	cp wp-config-sample.php wp-config.php
	# installs WordPress core with the specified settings, such as the site URL, site name, and the admin user's login credentials
	wp core install --allow-root --path=/var/www/html --url=${DOMAIN_NAME} --title=${WORDPRESS_NAME} --admin_user=${WORDPRESS_ROOT_LOGIN} --admin_password=${MYSQL_ROOT_PASSWORD} --admin_email=${WORDPRESS_ROOT_EMAIL}
	#installs and activates the Astra theme
	wp theme install astra --activate --allow-root --path=/var/www/html
	#uninstalls the Akismet and Hello plugins
	wp plugin uninstall --allow-root --path=/var/www/html akismet hello
	#sets the Redis serverin the WordPress configuration file
	wp config set WP_REDIS_HOST redis --allow-root
	wp config set WP_REDIS_PORT 6379 --raw --allow-root
	wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
	wp config set WP_REDIS_CLIENT phpredis --allow-root
	#nstalls and activates the Redis Object Cache plugin
	wp plugin install --allow-root --path=/var/www/html redis-cache --activate
	#updates all installed plugins
	wp plugin update --all --allow-root --path=/var/www/html
	#enables Redis Object Cache for all installed plugins
	wp redis enable --all --allow-root --path=/var/www/html
	#changes the ownership of the WordPress installation directory to the www-data user and group
	chown -R www-data:www-data /var/www/html
	#sets the directory permissions of the WordPress installation directory to 774
	chmod -R 774 /var/www/html
	# removes the downloaded WordPress core files and directories
	rm -rf wordpress
else
	echo "wordpress already downloaded"
fi
#starts the PHP-FPM server in foreground mode, which listens for incoming requests and handles them
php-fpm7.3 -F