#!/usr/bin/env bash
#
# Copyright (C) 2021 Zou Jiancheng <pacmanzou@qq.com>
#
# Description: cpupower set
#

cat < "$HOME/personal/manjaro_password.txt" | sudo -S cpupower frequency-set -d 2.4Ghz
