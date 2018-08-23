# Docker Mosquitto image for Raspberry Pi

This image contains Open Source MQTT Broker [Eclipse Mosquitto](http://mosquitto.org) in an [Alpine](https://hub.docker.com/r/_/alpine/) base image.

## How to run:
```
docker run -tip 1883:1883 -p 9001:9001 volubel/rpi-docker-mqtt
```

Exposes Port 1883 (MQTT) and 9001 (Websocket MQTT)

Alternatively you can use volumes to make the changes persistent and change the configuration.
```
# place your mosquitto.conf in /srv/mqtt/config/
# NOTE: You have to change the permissions of the directories
# to allow the user to read/write to data and log and read from
# config directory
# For TESTING purposes you can use chmod -R 777 /srv/mqtt/*
# Better use "-u" with a valid user id on your docker host

docker run -ti -p 1883:1883 -p 9001:9001 \
-v mqtt/config:/mqtt/config:ro \
-v mqtt/log:/mqtt/log \
-v mqtt/data/:/mqtt/data/ \
--name mqtt volubel/rpi-docker-mqtt
```

## How to create this image

Run all the commands from within the project root directory.

### Build the Docker Image
```bash
make build
```

#### Push the Docker Image to the Docker Hub
* First use a `docker login` with username, password and email address
* Second push the Docker Image to the official Docker Hub

```bash
make push
```
