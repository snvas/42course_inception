FROM debian:buster

RUN apt update -y && \
	apt install redis-server -y && \
	apt install php-redis -y

COPY --chmod=640 ./conf/redis.conf	/etc/redis/redis.conf
RUN service redis-server restart

CMD ["redis-server", "--protected-mode", "no"]
