#!/usr/bin/env bash
filetype=$1
filepath=$2
shift
shift
params=$*
case $filetype in
javascript)
    node "$filepath" "$params"
    ;;

sh)
    bash "$filepath" "$params"
    ;;

python)
    python3 "$filepath" "$params"
    ;;

*)
    echo -n "unknown"
    ;;
esac
