#!/usr/bin/env bash
#
# Copyright (C) 2021 Zou Jiancheng <pacmanzou@qq.com>
#
# Description: restart fcitx
#

killall fcitx5

sleep 0.1
fcitx5 &

sleep 0.1
notify-send 'Fcitx5 restart'
