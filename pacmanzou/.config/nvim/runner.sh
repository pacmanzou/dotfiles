#!/usr/bin/env bash
filetype=$1
filepath=$2
shift
shift
params=$*
case $filetype in
go)
    go run "$filepath" "$params"
    ;;

python)
    python3 "$filepath" "$params"
    ;;

sh)
    bash "$filepath" "$params"
    ;;

javascript)
    node "$filepath" "$params"
    ;;

*)
    echo -n "unknown this filetype"
    ;;
esac
