#!/usr/bin/env bash
#
# Copyright (C) 2021 Zou Jiancheng <pacmanzou@qq.com>
#
# Description: restart fcitx
#

killall fcitx

sleep 0.1
fcitx &

sleep 0.1
notify-send 'Fcitx restart'
