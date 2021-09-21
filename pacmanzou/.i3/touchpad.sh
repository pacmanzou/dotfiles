#!/usr/bin/env bash
#
# Description: Disable the touch pad
# Time: 22:32:35 2020-11-06

declare -i ID

ID=$(xinput list | grep -Eio '(touchpad|glidepoint)\s*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}')

declare -i STATE

STATE=$(xinput list-props "$ID" | grep 'Device Enabled' | awk '{print $4}')

if [ "$STATE" -eq 1 ]; then
    xinput disable "$ID"
    notify-send 'No touchpad'
else
    xinput enable "$ID"
    notify-send 'Open the touchpad'
fi
