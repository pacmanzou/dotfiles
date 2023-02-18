#!/usr/bin/env bash
# Copyright (C) 2022 pacmanzou <pacmanzou@qq.com>
# Description: Modify the lctrl and caps, rctrl and ralt keys

# shellcheck disable=1091
source "$HOME/dotfiles/handler.sh"

CopyHandler "$HOME/dotfiles/misc/evdev" "/usr/share/X11/xkb/keycodes/evdev"
