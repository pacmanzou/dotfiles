#!/usr/bin/env bash
#
# Copyright (C) 2021 Zou Jiancheng <pacmanzou@qq.com>
#
# Description: restart fcitx
#

killall fcitx5
fcitx5 &

notify-send 'Restart the fcitx5'
