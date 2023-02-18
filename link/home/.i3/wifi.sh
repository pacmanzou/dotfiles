#!/usr/bin/env bash
# Copyright (C) 2020 pacmanzou <pacmanzou@qq.com>
# Description: Open the wifi list

# rescan
nmcli device wifi rescan

_dmenu() {
    dmenu -i -b -nb '#1d1d1d' -nf '#ebdbb2' -sf '#ebdbb2' -sb '#353535' -fn '' "$@"
}

SSID=$(nmcli device wifi list | sed -n '2,$p' | _dmenu -l 14 -p "" | awk '{print $1}')

if [[ -z "${SSID}" ]]; then
    exit 0
else
    PASS=$(_dmenu -l 0 -p "password")
    if [[ -z "${PASS}" ]]; then
        nmcli device wifi connect "${SSID}"
    else
        nmcli device wifi connect "${SSID}" password "${PASS}"
    fi
fi
