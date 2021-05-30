#!/usr/bin/env bash
#
# Description: Fast open dictionary, CET4+6 and GRE_8000. Also available online
# Time: 22:32:35 2020-11-06

declare -a list_array

list_array=(Online Saved Del All A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

dict_path="$HOME/Scripts/misc/dictionary.txt"

file="$HOME/.word"

if [[ ! -f "${file}" ]]; then
    touch "$HOME"/.word
fi

_dmenu() {
    dmenu -i -b -nb '#000000' -nf '#ebdbb2' -sf '#ebdbb2' -sb '#353535' -fn '' "$@"
}

list_get() {
    for i in "${list_array[@]}"; do
        echo "$i"
    done
}

string_get() {
    query=$(list_get | _dmenu -l 0 -p 'translate')

    case "${query}" in
    Online) translate_online ;;
    Saved) display ;;
    Del) delete ;;
    All) select_string="$(sed -n '1,$p' "${dict_path}")" ;;
    A) select_string="$(sed -n '/^A /,/^B /p' "${dict_path}" | sed '$d')" ;;
    B) select_string="$(sed -n '/^B /,/^C /p' "${dict_path}" | sed '$d')" ;;
    C) select_string="$(sed -n '/^C /,/^D /p' "${dict_path}" | sed '$d')" ;;
    D) select_string="$(sed -n '/^D /,/^E /p' "${dict_path}" | sed '$d')" ;;
    E) select_string="$(sed -n '/^E /,/^F /p' "${dict_path}" | sed '$d')" ;;
    F) select_string="$(sed -n '/^F /,/^G /p' "${dict_path}" | sed '$d')" ;;
    G) select_string="$(sed -n '/^G /,/^H /p' "${dict_path}" | sed '$d')" ;;
    H) select_string="$(sed -n '/^H /,/^I /p' "${dict_path}" | sed '$d')" ;;
    I) select_string="$(sed -n '/^I /,/^G /p' "${dict_path}" | sed '$d')" ;;
    J) select_string="$(sed -n '/^J /,/^K /p' "${dict_path}" | sed '$d')" ;;
    K) select_string="$(sed -n '/^K /,/^L /p' "${dict_path}" | sed '$d')" ;;
    L) select_string="$(sed -n '/^L /,/^M /p' "${dict_path}" | sed '$d')" ;;
    M) select_string="$(sed -n '/^M /,/^N /p' "${dict_path}" | sed '$d')" ;;
    N) select_string="$(sed -n '/^N /,/^O /p' "${dict_path}" | sed '$d')" ;;
    O) select_string="$(sed -n '/^O /,/^P /p' "${dict_path}" | sed '$d')" ;;
    P) select_string="$(sed -n '/^P /,/^Q /p' "${dict_path}" | sed '$d')" ;;
    Q) select_string="$(sed -n '/^Q /,/^R /p' "${dict_path}" | sed '$d')" ;;
    R) select_string="$(sed -n '/^R /,/^S /p' "${dict_path}" | sed '$d')" ;;
    S) select_string="$(sed -n '/^S /,/^T /p' "${dict_path}" | sed '$d')" ;;
    T) select_string="$(sed -n '/^T /,/^U /p' "${dict_path}" | sed '$d')" ;;
    U) select_string="$(sed -n '/^U /,/^V /p' "${dict_path}" | sed '$d')" ;;
    V) select_string="$(sed -n '/^V /,/^W /p' "${dict_path}" | sed '$d')" ;;
    W) select_string="$(sed -n '/^W /,/^X /p' "${dict_path}" | sed '$d')" ;;
    X) select_string="$(sed -n '/^X /,/^Y /p' "${dict_path}" | sed '$d')" ;;
    Y) select_string="$(sed -n '/^Y /,/^Z /p' "${dict_path}" | sed '$d')" ;;
    Z) select_string="$(sed -n '/^Z /,$p' "${dict_path}")" ;;
    # important
    *) exit ;;
    esac
}

copy() {
    copy_string=$(echo "${query}" | awk '{print $1}')

    echo -n "${copy_string}" | xsel -ib
    if [[ -n "${copy_string}" ]]; then
        exit
    fi
}

save_local() {
    if [[ -n "${query}" ]]; then
        # if first arg is exist, not append
        first_arg_local=$(echo "${query}" | awk '{print $1}')
        if [[ $(grep -c "${first_arg_local}" "${file}") == 0 ]]; then
            echo "${query}" >>"${file}"
            notify-send "Save successfully"
        else
            notify-send "Saved"
        fi
    fi
}

delete() {
    query=$(tac "$HOME"/.word | _dmenu -l 14 -p "saved")
    del_string=$(echo "${query}" | awk '{print $1}')

    sed -i '/'"${del_string}"'/d' "${file}"
}

save_online() {
    first_line_mean=$(echo "${mean}" | sed -n '1p' | awk '$1=$1"    "')
    # if first arg is exist, not append
    first_arg_online=$(echo "${first_line_mean}" | awk '{print $1}')

    if [[ $(grep -c "${first_arg_online}" "${file}") == 0 ]]; then
        echo "${first_line_mean}" >>"${file}"
        mean=$(echo -e " [save successfully]" "\n" "$mean")
    else
        mean=$(echo -e " [saved]" "\n" "$mean")
    fi

    notify-send "$mean"
}

display() {
    query=$(tac "$HOME"/.word | _dmenu -l 14 -p "saved")

    copy
}

translate_online() {
    query=$(_dmenu -l 0 -p "translate")

    if [[ -n "$query" ]]; then
        mean=$(ydcv -c never "$query")
        save_online
    fi
}

translate_local() {
    query=$(echo "${select_string}" | _dmenu -l 14 -p 'word')
    save_local
}

main() {
    # get selected string
    string_get

    if [[ -n "${select_string}" ]]; then
        translate_local
        select_string=""
    fi
}

while true; do
    main
done
