#!/usr/bin/env bash
#
# Description: Bookmark and history for chromium
# Time: 22:32:35 2020-11-06

# config
DMENU_MARKS="dmenu -i -b -l 14 -nb '#000000' -nf '#ebdbb2' -sf '#ebdbb2' -sb '#353535' -p 'marks' -fn ''"
DMENU_HISTORIES="dmenu -i -b -l 14 -nb '#000000' -nf '#ebdbb2' -sf '#ebdbb2' -sb '#353535' -p 'histories' -fn ''"
BOOKMARK_FILE="$HOME/.config/chromium/Default/Bookmarks"
HISTORY_FILE="$HOME/.config/chromium/Default/History"
CHROME_BIN="chromium --disable-gpu --disable-software-rasterizer"
PYTHON_BIN="python3"

cd "$(dirname "$0")" || exit

# history dmenu
function history_dmenu() {
    OLDIFS=$IFS
    IFS=''
    SELECT_HISTORIES=$(${PYTHON_BIN} history.py "$HISTORY_FILE" | eval "${DMENU_HISTORIES}")
    for SELECT_HISTORY in $SELECT_HISTORIES; do
        IFS=$OLDIFS
        echo "$SELECT_HISTORY"
        if [ "$SELECT_HISTORY" != "" ]; then
            URL=$(echo "$SELECT_HISTORY" | sed -r 's/.+\[(.+)\]$/\1/')
            $CHROME_BIN "$URL"
        fi
    done
    IFS=$OLDIFS
}

# args
if [ "$1" == "--help" ]; then
    echo "$0 [--history] [default_url]"
    exit
fi
if [ "$1" == "--history" ]; then
    history_dmenu
    exit
fi

# check file
if [ ! -e "$BOOKMARK_FILE" ]; then
    echo "Chrome Bookmark Not Found!: $BOOKMARK_FILE"
    exit 1
fi

if [ ! -e "$HISTORY_FILE" ]; then
    echo "Chrome History Not Found!: $HISTORY_FILE"
    exit 1
fi

# default url
BOOKMARK_NAMES=""
if [ "$1" != "" ]; then
    # too long
    if [ ${#1} -gt "150" ]; then
        STR=$(echo "$1" | tr -d '\n' | cut -c 1-150)"..."
    else
        STR=$(echo "$1" | tr -d '\n')
    fi
    BOOKMARK_NAMES="0000:[$STR]
"
fi

BOOKMARK_NAMES+=$(${PYTHON_BIN} bookmark.py --name "$BOOKMARK_FILE")
BOOKMARK_URLS=$(${PYTHON_BIN} bookmark.py --url "$BOOKMARK_FILE")

SELECT_NAMES=$(echo "$BOOKMARK_NAMES" | eval "${DMENU_MARKS}")
OLDIFS=$IFS
IFS=''

for SELECT_NAME in $SELECT_NAMES; do
    IFS=$OLDIFS
    if [ "$SELECT_NAME" != "" ]; then
        SELECT_LINE=$(echo "$SELECT_NAME" | sed -r 's/^([0-9]+):.+$/\1/')

        # History select
        if [ "${SELECT_NAME}" == "H" ]; then
            history_dmenu
            exit
        fi

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

IFS=$OLDIFS
