#The FROM instruction sets the base image to be used for the Docker build
FROM debian:buster

#The RUN instruction executes the apt-get update and apt-get install commands 
#to update the package list and install the necessary packages, in this case, nginx and openssl.
RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx openssl && \
	rm -rf /var/lib/apt/lists/*

#The EXPOSE instruction exposes port 443 to allow incoming traffic.
EXPOSE 443

# Configure Nginx
#The COPY instruction copies the Nginx configuration file nginx.conf and the tools directory 
#to the /etc/nginx/conf.d/ and /etc/nginx/tools directories, respectively.
COPY ./conf/nginx.conf ./etc/nginx/conf.d/
COPY ./tools/ ./etc/nginx/tools

#The ENTRYPOINT instruction sets the command that will be run when the container starts.
ENTRYPOINT [ "bash", "/etc/nginx/tools/nginx.sh" ];

#The CMD instruction specifies the default command to run when the container is started, 
#which in this case is nginx -g "daemon off;".
CMD ["nginx", "-g", "daemon off;"]