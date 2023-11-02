#!/usr/bin/env bash
# Copyright (C) 2023 pacmanzou <pacmanzou@qq.com>
# Description: Automatically change wallpaper

url="https://source.unsplash.com/1920x1080/?random"
wallpaper="$HOME/.i3/wallpaper.png"

while :; do
	sleep 1h
	curl -L -s -o "$wallpaper" "$url"
	nitrogen --set-zoom-fill "$wallpaper"
done
