FROM debian:buster

RUN apt update -y
RUN apt install vsftpd -y

COPY ./conf/vsftpd.conf /var/www/vsftpd.conf
COPY ./tools/setupftp.sh /var/www/setupftp.sh

CMD ["bash", "/var/www/setupftp.sh"]