FROM debian:buster

# Install MariaDB server and client
RUN apt-get update && \
	apt-get install -y mariadb-server mariadb-client && \
	rm -rf /var/lib/apt/lists/*

# Allow mysqld daemon to run, purge and recreate /var/lib/mysql with appropriate ownership
# Ensure /var/run/mysqld is writable regardless of UID of mysqld at runtime
RUN mkdir -p /var/run/mysqld &&\
	chown -R mysql:mysql /var/run/mysqld &&\
	chmod 777 /var/run/mysqld

# Expose port 3306 (default port for MariaDB)
EXPOSE 3306

# Copy shell script that sets up MariaDB database and user accounts
COPY ./tools/mariadb.sh /usr/local/bin/
COPY ./conf/wordpress.sql /usr/local/bin/

# Set permissions for the script to be executable
RUN chmod +x /usr/local/bin/mariadb.sh
RUN chmod +x /usr/local/bin/wordpress.sql

# Set entrypoint to run the shell script
ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]

# Set command to start mysqld and bind it to all available network interfaces
CMD [ "mysqld", "--bind-address=0.0.0.0" ]