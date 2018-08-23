# Pull base image
FROM multiarch/debian-debootstrap:armhf-stretch
#MAINTAINER name <email-address>

#RUN apt-get update && apt-get install -y wget
RUN apt-get update && apt-get install -my wget gnupg

## refer to http://repo.mosquitto.org/debian/readme.txt
# add Debian repo key to keyring
RUN wget -q -O - http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key | apt-key add -
# add repo to sources.list and install
RUN wget -q -O /etc/apt/sources.list.d/mosquitto-stretch.list http://repo.mosquitto.org/debian/mosquitto-stretch.list
RUN apt-get update && apt-get install -y mosquitto

RUN adduser --system --disabled-password --disabled-login mosquitto

COPY config /mqtt/config
VOLUME ["/mqtt/config", "/mqtt/data", "/mqtt/log"]

EXPOSE 1883 9001
CMD /usr/sbin/mosquitto -c /mqtt/config/mosquitto.conf
