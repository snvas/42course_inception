FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install nginx -y

COPY conf /etc/nginx/sites-available

RUN ln -s /etc/nginx/sites-available/snovaes.42.fr-site /etc/nginx/sites-enabled/

RUN mkdir -p /var/www/site

COPY tools /var/www/site

EXPOSE 7000

ENTRYPOINT ["nginx", "-g", "daemon off;"]