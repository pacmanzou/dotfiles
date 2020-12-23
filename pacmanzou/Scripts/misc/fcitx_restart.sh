#!/usr/bin/env bash
#
# Description: Restart fcitx
# Time: 22:32:35 2020-11-06

killall fcitx
sleep 0.1
fcitx &
