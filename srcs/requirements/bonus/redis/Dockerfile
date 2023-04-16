FROM alpine:3.16

#updating the package repository and upgrading any existing packages. 
# installing Redis without caching any installation files using the --no-cache flag. 
# modifying the default Redis configuration file /etc/redis.conf to change the listening address, 
#set the maximum memory limit to 256 MB, set the maximum memory eviction policy to allkeys-lfu, 
#and disable protected mode. Finally, we are cleaning up the cache to reduce the size of the image.
RUN apk update && apk upgrade && \
    apk add --no-cache redis && \
    sed -i "s/bind 127.0.0.1/#bind 127.0.0.1/g" /etc/redis.conf; \
    sed -i "s/maxmemory <bytes>/maxmemory 256mb/g" /etc/redis.conf; \
    sed -i "s/maxmemory-policy noeviction/maxmemory-policy allkeys-lfu/g" /etc/redis.conf; \
    sed -i "s/protected-mode yes/protected-mode no/g" /etc/redis.conf; \
    rm -rf /var/cache/apk/*

#creates a new directory /data and changes its ownership to the Redis user redis
RUN mkdir /data && chown redis:redis /data

#xposes port 6379, which is the default port used by Redis
EXPOSE 6379

CMD [ "/usr/bin/redis-server" , "/etc/redis.conf" ]