# Docker Mosquitto image for Raspberry Pi

This image contains [Eclipse Mosquitto](http://mosquitto.org) in an Alpine base image.

To run:
```
docker run -p 1883:1883 volubel/rpi-docker-mqtt
```

To install as a service:
```
docker run -p 1883:1883 --detach --restart unless-stopped --name mosquitto volubel/rpi-docker-mqtt
```
