#!/usr/bin/env bash
#
# Copyright (C) 2021 Zou Jiancheng <pacmanzou@qq.com>
#
# Description: copy the github token
#

xclip -i -sel clipboard "$HOME/personal/github_token.txt"

notify-send "Copy the github_token"
