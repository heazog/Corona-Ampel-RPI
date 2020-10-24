#!/bin/bash

CMD="$1"
GPIO="$2"
VALUE="$3"


if [ $CMD = "init" ]; then
	if [ ! -d "/sys/class/gpio/gpio$GPIO" ]; then
		 echo $GPIO > /sys/class/gpio/export
	fi

	echo $VALUE > /sys/class/gpio/gpio$GPIO/direction
fi

if [ "$1" = "set" ]; then
	echo $VALUE > /sys/class/gpio/gpio$GPIO/value
fi
