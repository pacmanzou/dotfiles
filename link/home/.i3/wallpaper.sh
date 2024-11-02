#!/usr/bin/env bash
# Copyright (C) 2023 pacmanzou <pacmanzou@qq.com>
# Description: Automatically change wallpaper

url="https://api.nguaduot.cn/wallhaven/random"
wallpaper="$HOME/.i3/wallpaper.png"

while :; do
    sleep 1h

    # Use user-agent google-chrome
    wget -U "Mozilla/5.0 (Windows NT 10.0; Win64; x64) \
        AppleWebKit/537.36 (KHTML, like Gecko) \
        Chrome/58.0.3029.110 Safari/537.36" \
        -O "$wallpaper" "$url"

    feh --bg-fill "$wallpaper"
done
