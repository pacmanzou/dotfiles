#!/usr/bin/env bash
#
# Description: Adjust cpu power
# Time: 22:32:35 2020-11-06

_dmenu() {
    dmenu -i -b -l 0 -nb '#000000' -nf '#ebdbb2' -sf '#ebdbb2' -sb '#353535' -fn '' "$@"
}

declare -a list_array

list_array=(powersave info)

function get_list() {
    for i in "${list_array[@]}"; do
        echo "$i"
    done
}

function powersave_value() {
    query=$(_dmenu -p "value")
    if [[ -n "${query}" ]]; then
        echo "m" | sudo -S cpupower frequency-set -d "${query}"Ghz
    else
        echo "Cancel"
    fi
}

function info() {
    message=$(cpupower frequency-info)
    echo "message=$message"
    notify-send "$message"
}

query="$( (get_list) | _dmenu -p 'cpupower')"

case "$query" in
powersave)
    powersave_value
    sleep 1
    info
    ;;
info) info ;;
esac
