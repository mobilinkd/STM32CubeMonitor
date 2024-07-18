#!/bin/bash

WORKDIR=$([ -z "$1" ] && echo `pwd` || echo "$1")

if [ ! -d ${WORKDIR} ]; then
	echo "$WORKDIR must be a directory"
	exit 1
fi

podman run --rm -e DISPLAY -e XAUTHORITY -v ${XAUTHORITY}:${XAUTHORITY}:rw -v /tmp/.X11-unix:/tmp/.X11-unix:rw -v /run/dbus/system_bus_socket:/run/dbus/system_bus_socket:rw  -v ${WORKDIR}:/work --privileged localhost/mobilinkd/stm32cubemon:latest
