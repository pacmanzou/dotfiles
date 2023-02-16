#!/usr/bin/env bash
#
# Copyright (C) 2023 pacmanzou <pacmanzou@qq.com>
#
# Description: toggle the keyboard
#

declare -i ID

ID=$(xinput list | grep -Eio '(set 2 keyboard)\s*id=[0-9]{1,2}' | grep -Eio 'id=[0-9]{1,2}'  | grep -Eo '[0-9]+')

declare -i STATE

STATE=$(xinput list-props "$ID" | grep 'Device Enabled' | awk '{print $4}')

if [ "$STATE" -eq 1 ]; then
    xinput disable "$ID"
    notify-send 'Keyboard(off)'
else
    xinput enable "$ID"
    notify-send 'Keyboard(on)'
fi
