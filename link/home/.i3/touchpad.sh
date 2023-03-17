#!/usr/bin/env bash
# Copyright (C) 2021 Zou Jiancheng <pacmanzou@qq.com>
# Description: Toggle the touch pad

declare -i ID

ID=$(xinput list | grep -Eio '(touchpad|glidepoint)\s*id=[0-9]{1,2}' |
	grep -Eo '[0-9]{1,2}')

declare -i STATE

STATE=$(xinput list-props "$ID" | grep 'Device Enabled' | awk '{print $4}')

if [ "$STATE" -eq 1 ]; then
	xinput disable "$ID"
	notify-send "Touchpad" "off"
else
	xinput enable "$ID"
	notify-send "Touchpad" "on"
fi
