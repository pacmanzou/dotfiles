#!/usr/bin/env bash
#
# Description: Bookmark for chromium
# Time: 22:32:35 2020-11-06

cd "$(dirname "$0")" || exit

DMENU_MARKS="dmenu -i -b -l 14 -nb '#000000' -nf '#ebdbb2' -sf '#ebdbb2' -sb '#353535' -p 'bookmarks' -fn ''"
PYTHON_BIN="python3"
BOOKMARK_FILE="$HOME/.config/chromium/Default/Bookmarks"
CHROME_BIN="chromium --disable-gpu --disable-software-rasterizer"
PREFIXES=(
    "gg https://www.google.com/search?q="
    "bd https://www.baidu.com/s?wd="
    "gh https://github.com/search?q="
    "ge https://search.gitee.com/?q="
    "lc https://leetcode-cn.com/problemset/all/?search="
)

# bookmark.py
BOOKMARK_NAMES+=$(${PYTHON_BIN} bookmark.py --name "$BOOKMARK_FILE")
BOOKMARK_URLS=$(${PYTHON_BIN} bookmark.py --url "$BOOKMARK_FILE")
SELECT_NAMES=$(echo "$BOOKMARK_NAMES" | eval "${DMENU_MARKS}")
OLDIFS=$IFS
IFS=''

# check file
if [ ! -e "$BOOKMARK_FILE" ]; then
    echo "Chrome Bookmark Not Found!: $BOOKMARK_FILE"
    exit 1
fi

# prefix
_prefix_launcher() {
    for i in "${PREFIXES[@]}"; do
        read -r -a PREFIX <<<"${i[@]}"
        if [ "${PREFIX[0]}" == "${1:0:2}" ]; then
            QUERY=$(echo "$1" | sed -r 's/^..[[:space:]]+(.*)$/\1/')
            if [ "$QUERY" != "$1" ]; then
                $CHROME_BIN "${PREFIX[1]}$QUERY"
            fi
            exit
        fi
    done
}

for SELECT_NAME in $SELECT_NAMES; do
    IFS=$OLDIFS
    if [[ -n "${SELECT_NAMES}" ]]; then
        _prefix_launcher "${SELECT_NAMES}"
    fi
    if [ "$SELECT_NAME" != "" ]; then
        SELECT_LINE=$(echo "$SELECT_NAME" | sed -r 's/^([0-9]+):(.+)$/\1/')
        # Bookmark
        if [ "$SELECT_LINE" != "00" ]; then
            (("$SELECT_LINE" + 1)) >/dev/null 2>&1
            # isNumeric?
            if [ $? -lt 2 ]; then
                URL=$(echo "$BOOKMARK_URLS" | sed -n "$SELECT_LINE"p | sed -r 's/^[0-9]+:(.+)$/\1/')
                if [ "$SELECT_LINE" == "$SELECT_NAME" ]; then
                    URL="about:blank"
                fi
            else
                URL="about:blank"
            fi
        else
            URL="$1"
        fi
        $CHROME_BIN "$URL"
    fi
done
