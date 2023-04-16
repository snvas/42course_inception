FROM debian:buster

#exposes port 8080 to allow incoming traffic
EXPOSE 8080

# updates the package index and upgrades the system packages
RUN apt-get update && apt-get upgrade -y

# installs the required packages, including PHP-FPM, MySQL client, and wget
RUN apt-get install -y php7.3-fpm php7.3-mysql mariadb-client wget

#removes the cached package files from the image to reduce its size
RUN rm -rf /var/lib/apt/lists/*

# copies the configuration file for PHP-FPM to its default location
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

#create directories for Adminer and PHP socket respectively
RUN mkdir -p /var/www/adminer
RUN mkdir -p /run/php

#downloads the Adminer PHP script from GitHub and saves it in the Adminer directory
ADD https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php /var/www/adminer/index.php

#set the appropriate ownership and permissions for the Adminer script
RUN chown -R www-data:www-data /var/www/adminer/index.php
RUN chmod 755 /var/www/adminer/index.php

#starts PHP-FPM with the --nodaemonize: is an option for the PHP-FPM process that prevents it from running 
#in the background as a daemon. This means that PHP-FPM will not detach from the terminal, 
#allowing the logs and output to be visible in the terminal.
#and --allow-to-run-as-root: allows it to run as the root user. By default, PHP-FPM will not allow itself 
#to run as root for security reasons, but in some cases, it may be necessary to run as root to access certain 
#files or resources on the system. This option bypasses the default security restriction.
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize", "--allow-to-run-as-root"]