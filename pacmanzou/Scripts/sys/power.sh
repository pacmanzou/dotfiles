#!/usr/bin/env bash
#
# Description: System power manager
# Time: 22:32:35 2020-11-06

_dmenu() {
    dmenu -i -b -l 0 -nb '#000000' -nf '#ebdbb2' -sf '#ebdbb2' -sb '#353535' -fn '' "$@"
}

declare -a list_array

list_array=(lock suspend logout reboot hibernate shutdown)

get_list() {
    for i in "${list_array[@]}"; do
        echo "$i"
    done
}

query="$(get_list | _dmenu -p 'exit')"

case "$query" in
lock) i3exit lock ;;
suspend) i3exit suspend ;;
logout) i3exit logout ;;
reboot) systemctl reboot ;;
hibernate) i3exit hibernate ;;
shutdown) i3exit shutdown ;;
esac
