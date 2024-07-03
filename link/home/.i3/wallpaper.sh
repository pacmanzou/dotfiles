#!/usr/bin/env bash
# Copyright (C) 2023 pacmanzou <pacmanzou@qq.com>
# Description: Automatically change wallpaper

url="https://api.nguaduot.cn/wallhaven/random"
wallpaper="$HOME/.i3/wallpaper.png"

while :; do
	sleep 1h
	curl -L --fail -s -o "$wallpaper" "$url"
	nitrogen --set-zoom-fill "$wallpaper"
done
