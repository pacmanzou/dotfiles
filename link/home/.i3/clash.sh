#!/usr/bin/env bash
# Copyright (C) 2023 Zou Jiancheng <pacmanzou@qq.com>
# Description: Restart the clash

killall cfw
cfw &

notify-send 'Restart the clash'

