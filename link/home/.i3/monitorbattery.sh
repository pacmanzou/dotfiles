#!/usr/bin/env bash
#
# Copyright (C) 2021 Zou Jiancheng <pacmanzou@qq.com>
#
# Description: when battery power less than 15, notify send

function Start() {
    battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')

    if [ "${battery_level}" -le 15 ];then
        notify-send --urgency=critical "Battery low" "Battery level is less than ${battery_level}%!"
    fi
}

while :; do
    Start
    sleep 60
done

