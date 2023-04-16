#!/bin/bash

#The mkdir command to create the directory and its parent directories if they don't exist
# with the name stored in the $CERTS_ environment variable.
mkdir -p $CERTS_

#The openssl req command generates a new self-signed SSL certificate and saves it to the 
#$CERTS_/cert.crt file and the private key to $CERTS_/cert.key.
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes\
		-out $CERTS_/cert.crt \
		-keyout $CERTS_/cert.key \
		-subj "/C=BR/ST=São Paulo/L=São Paulo/O=42SP/OU=Inception/CN=snovaes/"

#The sed commands replace the placeholder values DOMAIN_NAME and CERTS_ in the Nginx configuration
# file nginx.conf with the actual values of the DOMAIN_NAME and CERTS_ environment variables.
sed -i "s|DOMAIN_NAME|${DOMAIN_NAME}|g" /etc/nginx/conf.d/nginx.conf
sed -i "s|CERTS_|${CERTS_}|g" /etc/nginx/conf.d/nginx.conf

#The exec "$@" command passes any command-line arguments to the entrypoint of the Docker container.
exec "$@"