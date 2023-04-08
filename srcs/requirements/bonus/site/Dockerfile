FROM debian:buster

RUN apt update

RUN apt install nginx -y

COPY conf /etc/nginx/sites-available

RUN ln -s /etc/nginx/sites-available/snovaes.42.fr-site /etc/nginx/sites-enabled/

RUN mkdir -p /var/www/site

COPY tools /var/www/site

EXPOSE 4000

ENTRYPOINT ["nginx", "-g", "daemon off;"]