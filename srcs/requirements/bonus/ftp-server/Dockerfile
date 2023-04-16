FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install vsftpd -y

RUN mkdir -p /var/www/html

COPY ./conf/vsftpd.conf /var/www/vsftpd.conf
COPY ./tools/setupftp.sh /var/www/setupftp.sh

CMD ["bash", "/var/www/setupftp.sh"]