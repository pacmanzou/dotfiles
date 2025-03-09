#!/usr/bin/env bash
# Copyright (C) 2023 pacmanzou <pacmanzou@qq.com>
# Description: Toggle the keyboard

declare -i ID

ID=$(xinput list | grep -Eio '(set 2 keyboard)\s*id=[0-9]{1,2}' |
	grep -Eio 'id=[0-9]{1,2}' | grep -Eo '[0-9]+')

declare -i STATE

STATE=$(xinput list-props "$ID" | grep 'Device Enabled' | awk '{print $4}')

if [[ $STATE -eq 1 ]]; then
	xinput disable "$ID"
	notify-send "键盘已禁用" "您现在无法使用自带键盘"
else
	xinput enable "$ID"
	notify-send "键盘已开启" "您现在可以正常使用自带键盘"
fi
