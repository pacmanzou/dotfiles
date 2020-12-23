#!/usr/bin/env bash
#
# document.sh
# Copyright (C) 2020 pacmanzou <pacmanzou@qq.com>
#
# Description: documents
#

declare -a list_array

list_array=(markdown pdf)

get_list() {
    for i in "${list_array[@]}"; do
        echo "$i"
    done
}

_dmenu() {
    dmenu -i -b -nb '#000000' -nf '#ebdbb2' -sf '#ebdbb2' -sb '#353535' -fn '' "$@"
}

query=$(get_list | _dmenu -l 0 -p 'document')

if [[ "${query}" == "pdf" ]]; then
    fd -tf ".pdf" ~/Documents/pdf/ | _dmenu -l 14 -p 'pdf' | xargs -0 -I{} xdg-open "{}"
elif [[ "${query}" == "markdown" ]]; then
    fd -tf ".md" ~/Documents/markdown/ | _dmenu -l 14 -p 'markdown' | xargs -0 -I{} xdg-open "{}"
fi
