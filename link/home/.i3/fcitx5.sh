#!/usr/bin/env bash
# Copyright (C) 2021 Zou Jiancheng <pacmanzou@qq.com>
# Description: Restart the fcitx5

killall fcitx5
fcitx5 &

notify-send "Custom" "restart the fcitx5"
