FROM debian:buster

#updates the package lists and installs the required packages - wget for downloading files, 
#and PHP 7.3 with FPM and MySQL extensions for running WordPress.
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
				wget				\
				# Wordpress core depencencies
				php7.3				\
				php7.3-fpm			\
				php7.3-mysqli 		\
				mariadb-client \
				php7.3-redis	\
				&& mkdir -p /run/php 
#creates a directory for PHP-FPM to use for storing its PID file.

# copies the www.conf file, which is the configuration file for PHP-FPM, to the 
#/etc/php/7.3/fpm/pool.d directory. The only change made to the default configuration is the 
#listen directive value.
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

# copies the utils directory
COPY ./utils/wordpress_config.sh /
COPY ./utils/wp-config.php /

# exposes port 9000, which is the default port used by PHP-FPM
EXPOSE 9000

#sets the entrypoint for the container to the wordpress_config.sh script located in the /utils 
#directory. This script is used to configure WordPress.
CMD [ "bash", "/wordpress_config.sh" ]
