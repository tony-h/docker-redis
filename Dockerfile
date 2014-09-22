# https://github.com/instructure/canvas-lms/wiki/Production-Start#redis
# https://docs.docker.com/examples/running_redis_service/

FROM ubuntu:12.04

RUN apt-get -y update

RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:chris-lea/redis-server
RUN apt-get update
RUN apt-get install -y redis-server

ADD redis.conf /etc/redis/

EXPOSE 6379
CMD  ["/usr/bin/redis-server", "/etc/redis/redis.conf"]
