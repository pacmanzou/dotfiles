#!/usr/bin/env bash
#
# Copyright (C) 2020 pacmanzou <pacmanzou@qq.com>
#
# Description: translate_online
#

_dmenu() {
    dmenu -i -b -nb '#000000' -nf '#ebdbb2' -sf '#ebdbb2' -sb '#1d1d1d' -fn '' "$@"
}

file="$HOME/.word"

if [[ ! -f "${file}" ]]; then
    touch "$HOME"/.word
fi

query=$(_dmenu -l 0 -p "translate")

if [[ -n "$query" ]]; then
    mean=$(ydcv -c never "$query")
    notify-send "$mean"
fi

first_line_mean=$(echo "${mean}" | sed -n '1p' | awk '$1=$1"    "')
# if first arg is exist, not append
first_arg_online=$(echo "${first_line_mean}" | awk '{print $1}')

if [[ $(grep -c "${first_arg_online}" "${file}") == 0 ]]; then
    echo "${first_line_mean}" >>"${file}"
fi
