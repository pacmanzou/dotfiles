#!/usr/bin/env bash
# Copyright (C) 2021 Zou Jiancheng <pacmanzou@qq.com>
# Description: When battery power less than 15, notify send

function Start() {
	battery_status=$(acpi -b | grep -Eo '[^ ]+$')
	battery_level=$(acpi -b | grep -Po '[0-9]+(?=%)')

	if [[ "${battery_status}" != "charged" ]]; then
		if [[ "${battery_level}" -le 20 ]]; then
			notify-send --urgency=critical "Battery low" "Battery level is less than ${battery_level}%!"
		fi
	fi
}

while :; do
	Start
	sleep 1m
done
