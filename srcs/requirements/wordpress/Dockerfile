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
				php7.3-redis \
				&& rm -rf /var/lib/apt/lists/*
				

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod a+x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
# copies the www.conf file, which is the configuration file for PHP-FPM, to the 
#/etc/php/7.3/fpm/pool.d directory. The only change made to the default configuration is the 
#listen directive value.
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

RUN mkdir -p /var/run/php && chmod 777 /var/run/php
#creates a directory for PHP-FPM to use for storing its PID file.
RUN mkdir -p /var/www/html

# copies the script
COPY ./tools/startwp.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/startwp.sh
ENTRYPOINT ["bash", "/usr/local/bin/startwp.sh"]

WORKDIR /var/www/html/

# exposes port 9000, which is the default port used by PHP-FPM
EXPOSE 9000

#sets the entrypoint for the container to the wordpress_config.sh script located in the /utils 
#directory. This script is used to configure WordPress.
CMD ["/usr/sbin/php-fpm7.3", "-F"]
