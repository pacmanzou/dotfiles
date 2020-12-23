#!/usr/bin/bash
#Description: Install
#Time: 21:41:10 2020-10-25

# set -e

# echo "moving home dotfiles ..."

# if [ -f "$HOME/.xprofile" ]; then
#     mv -f ~/.xprofile "$PWD"/misc/backup/
#     ln -s "$PWD"/home/.xprofile ~/
# else
#     ln -s "$PWD"/home/.xprofile ~/
# fi

# if [ -e "$HOME/.i3/" ]; then
#     if [ -L "$HOME/.i3/" ]; then
#         true
#     else
#         mv -f ~/.i3/ "$PWD"/misc/backup/
#         ln -s -f "$PWD"/home/.i3/ ~/
#     fi
# else
#     ln -s -f "$PWD"/home/.i3/ ~/
# fi
