#!/usr/bin/env bash
# Copyright (C) 2022 pacmanzou <pacmanzou@qq.com>
# Description: operation handler for copy or link

Info() {
    printf '[\033[0;34minfo\033[0m] %b\n' "$1"
}

Warn() {
    printf '[\033[0;33mwarning\033[0m] %b\n' "$1"
}

Success() {
    printf '[\033[0;32msuccess\033[0m] %b\n' "$1"
}

Fail() {
    printf '[\033[0;31mfailure\033[0m] %b\n' "$1"
}

LinkHandler() {
    if sudo ln -bs "$1" "$2"; then
        Success "ln -bs $1 $2"
    else
        Fail "ln -bs $1 $2"
    fi
}

CopyHandler() {
    if sudo cp -abr "$1" "$2"; then
        Success "cp -abr $1 $2"
    else
        Fail "cp -abr $1 $2"
    fi
}

FileHandler() {
    for fileSrc in $1; do
        basenameSrc=$(basename "${fileSrc}")
        if [[ "." == "${basenameSrc}" || ".." == "${basenameSrc}" ||
            "*" == "${basenameSrc}" ]]; then
            continue
        fi
        for fileDst in $2; do
            basenameDst=$(basename "${fileDst}")
            dirnameDst=$(dirname "${fileDst}")
            if [[ "${basenameDst}" == "${basenameSrc}" ]]; then
                sudo mv "${fileDst}" "${fileDst}"~
            fi
        done
        $3 "${fileSrc}" "${dirnameDst}"
    done
}
