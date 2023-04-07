#!/bin/sh

# Check if Wordpress is already installed
if [ ! -f ./var/www/html/wp-config.php ]
then
	#downloads the latest version of WordPress from the official website using wget.
	wget https://wordpress.org/latest.tar.gz
	#extracts the downloaded file using tar command and removes the tar file.
	tar xzf latest.tar.gz
	rm -q latest.tar.gz

	# Set environment variables in wp-config.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wordpress/wp-config-sample.php
	sed -i "s/username_here/$MYSQL_USER/g" wordpress/wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wordpress/wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wordpress/wp-config-sample.php

	# Copy the sample config file to wp-config.php
	cp wordpress/wp-config-sample.php wordpress/wp-config.php

	# Copy Wordpress files to the web root directory
	mkdir -p /var/www/html
	cp -r wordpress/* /var/www/html/

	# Remove the downloaded archive and extracted directory
	rm -frq wordpress
else
	echo "wordpress already downloaded"
fi

#If everything goes well, it executes the CMD command.
exec "$@"