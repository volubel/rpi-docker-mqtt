# Docker Mosquitto image for Raspberry Pi

This image contains Open Source MQTT Broker [Eclipse Mosquitto](http://mosquitto.org) in an [Alpine](https://hub.docker.com/r/_/alpine/) base image.

To run:
```
docker run -p 1883:1883 volubel/rpi-docker-mqtt
```

To install as a service:
```
docker run -p 1883:1883 --detach --restart unless-stopped --name mosquitto volubel/rpi-docker-mqtt
```
