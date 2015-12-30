## -*- docker-image-name: "mcreations/openwrt-ftp" -*-

FROM armbuild/debian:jessie
MAINTAINER Kambiz Darabi <darabi@m-creations.net>

ENV FTP_USER ftp
ENV FTP_PASS changeit

# the HOST var is necessary for passive mode, so the client knows
# where to connect, if you are not running the docker container
# locally, you MUST specify a host name which is resolvable over the
# network
ENV HOST localhost

ADD image/root/ /

RUN apt-get update &&\
    apt-get install -y vsftpd &&\
    rm -rf /var/lib/apt/lists/*

EXPOSE 21
EXPOSE 65000-65100

CMD ["/start-ftp"]
