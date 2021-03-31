#!/usr/bin/env bash
#
# Description: Record what you're going to do
# Time: 22:32:35 2020-11-06

file="$HOME/.task"

if [[ ! -f "${file}" ]]; then
    touch "$file"
fi

_dmenu() {
    dmenu -i -b -l 14 -nb '#000000' -nf '#ebdbb2' -sf '#ebdbb2' -sb '#353535' -fn '' "$@"
}

add_task() {
    echo -e "$(date +"%m-%d")   " "$cmd" >>"$file"
}

cmd=$(_dmenu -p "task" <"$file")

while [ -n "$cmd" ]; do
    if grep -q "^$cmd\$" "$file"; then
        grep -v "^$cmd\$" "$file" >"$file.$$"
        mv "$file.$$" "$file"
    else
        add_task
    fi
    cmd=$(_dmenu -p "task" "$@" <"$file")
done
