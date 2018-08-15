FROM alpine:3.8
LABEL Description="MQTT docker image for RasPi"

RUN apk --no-cache add mosquitto

# Expose MQTT port
EXPOSE 1883

ENTRYPOINT ["/usr/sbin/mosquitto"]
