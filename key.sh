#!/usr/bin/env bash
# Copyright (C) 2022 pacmanzou <pacmanzou@qq.com>
# Description: Modify the lctrl and caps, rctrl and ralt keys

sudo cp -abr "$HOME/dotfiles/misc/evdev" "/usr/share/X11/xkb/keycodes/evdev"
echo "Successfully changed"
