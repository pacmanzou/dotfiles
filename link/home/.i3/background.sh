#!/usr/bin/env bash
# Copyright (C) 2023 pacmanzou <pacmanzou@qq.com>
# Description: Automatically change background

while :; do
	sleep 1h

	wget -O "$HOME/.i3/background.png" https://source.unsplash.com/1920x1080
	nitrogen --set-zoom-fill "$HOME/.i3/background.png"
done
