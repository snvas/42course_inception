FROM debian:buster

#updates and upgrades the Debian package manager
RUN apt-get update && apt-get upgrade -y

#installs Nginx web server
RUN apt-get install nginx -y

#copies the configuration files for the Nginx server to /etc/nginx/sites-available/
COPY conf /etc/nginx/sites-available

#creates a symbolic link to the configuration file of the Nginx server in the sites-enabled directory
RUN ln -s /etc/nginx/sites-available/snovaes.42.fr-site /etc/nginx/sites-enabled/

#creates the directory to store the web files
RUN mkdir -p /var/www/site

#copies the web files to /var/www/site/
COPY tools /var/www/site

#exposes port 7000 to the host
EXPOSE 7000

#sets the entry point to run the Nginx server with the option -g daemon off;, which prevents Nginx 
#from running as a daemon and running in the foreground
ENTRYPOINT ["nginx", "-g", "daemon off;"]