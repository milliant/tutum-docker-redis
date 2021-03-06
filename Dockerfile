FROM ubuntu:trusty
MAINTAINER Fernando Mayo <fernando@tutum.co>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv C7917B12 && \
    apt-get update && \
    apt-get install -y redis-server pwgen && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add scripts
ADD run.sh /run.sh
ADD set_redis_password.sh /set_redis_password.sh
RUN chmod +x /*.sh

# SET environment variables
ENV REDIS_MODE **None**
ENV REDIS_TIMEOUT 0
ENV REDIS_PASS **Random**

EXPOSE 6379
CMD ["/run.sh"]
