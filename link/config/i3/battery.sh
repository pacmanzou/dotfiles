#!/usr/bin/env bash
# Copyright (C) 2021 Zou Jiancheng <pacmanzou@qq.com>
# Description: Low electricity notice

while :; do
	battery_status=$(acpi -b | grep -Eo '[^ ]+$')
	battery_level=$(acpi -b | grep -Po '[0-9]+(?=%)')

	if [[ "${battery_status}" != "charged" ]]; then
		if [[ "${battery_level}" -le 15 ]]; then
			notify-send --urgency=critical "电池电量不足" "当前电量少于15%,建议您立即充电"
		fi
	fi
	sleep 1m
done
