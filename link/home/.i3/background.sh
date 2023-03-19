#!/usr/bin/env bash
# Copyright (C) 2023 pacmanzou <pacmanzou@qq.com>
# Description: Automatically change background

url="https://source.unsplash.com/1920x1080"
background="$HOME/.i3/background.png"

while :; do
	sleep 1h

	curl -L -s -o "$background" "$url"
	nitrogen --set-zoom-fill "$background"
done
