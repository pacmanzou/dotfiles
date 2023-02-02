#!/usr/bin/env bash
#
# Copyright (C) 2020 pacmanzou <pacmanzou@qq.com>
#
# Description: An installation script for manjaro-i3 community edition, applies to i3 only.
#

# shellcheck disable=1091
source "$HOME/dotfiles/handler.sh"

file="$HOME/.gitconfig"

if [[ -f "${file}" ]]; then
    Warn "If you want to run this script, please remove the .gitconfig!"
    Fail "Failed to run this script"
    exit 1
fi

# link
Info "### link to ... ###"
FileHandler "$HOME/dotfiles/link/home/.* $HOME/dotfiles/link/home/*" "$HOME/.* $HOME/*" LinkHandler
FileHandler "$HOME/dotfiles/link/config/*" "$HOME/.config/*" LinkHandler
FileHandler "$HOME/dotfiles/link/bin/*" "/usr/local/bin/*" LinkHandler
echo

# copy
Info "### copy to ... ###"
FileHandler "$HOME/dotfiles/copy/home/.* $HOME/dotfiles/copy/home/*" "$HOME/.* $HOME/*" CopyHandler
FileHandler "$HOME/dotfiles/copy/config/*" "$HOME/.config/*" CopyHandler
FileHandler "$HOME/dotfiles/copy/etc/*" "/etc/*" CopyHandler
echo

Info "### update system ###"
sudo pacman-mirrors -i -c China -m rank
sudo pacman -Syy
sudo pacman -S archlinuxcn-keyring
sudo pacman -Syu
sudo pacman -S alacritty \
    baidupcs-go \
    bleachbit \
    bluez \
    bluez-utils \
    blueman \
    ctags \
    copyq \
    cmake \
    docker \
    exa \
    fd \
    fcitx5 \
    fcitx5-rime \
    fcitx5-configtool \
    go \
    gcc \
    gparted \
    htop \
    lightdm-settings \
    lazygit \
    lazydocker \
    mpv \
    manjaro-asian-input-support-fcitx5 \
    manjaro-settings-manager \
    materia-gtk-theme \
    music-dl \
    mycli \
    neofetch \
    nodejs-lts-fermium \
    npm \
    neovim \
    neomutt \
    obs-studio \
    pcmanfm-gtk3 \
    python-pip \
    ripgrep \
    rar \
    scrcpy \
    seahorse \
    shellcheck \
    shfmt \
    tldr \
    typespeed \
    viewnior \
    tmux \
    trash-cli \
    ttf-hack \
    unzip \
    utools \
    vnote-git \
    virtualbox \
    wqy-microhei \
    xclip \
    yarn \
    you-get \
    yay \
    zip \
    zathura \
    zathura-pdf-mupdf

# yay -S abook \
#     apifox \
#     debtap \
#     google-chrome \
#     linuxqq \
#     mutt-wizard \
#     mindmaster_cn \
#     simple-mtpfs \
#     sqls \
#     wps-office-cn \
#     wps-office-mui-zh-cn \
#     wps-office-fonts \
#     wps-office-mime-cn

Info "### npm install ###"
sudo npm install -g json-server \
    reveal-md
echo

Info "### pip install ###"
pip install black \
    pynvim
echo

Info "### go install ###"
go install mvdan.cc/gofumpt@latest
go install github.com/cweill/gotests/...@latest
echo

# misc
Info "### misc ###"
CopyHandler "$HOME/dotfiles/misc/UPower.conf" "/etc/UPower/UPower.conf"
CopyHandler "$HOME/dotfiles/misc/logind.conf" "/etc/systemd/logind.conf"
echo

Info "### manual configuration ###"
Info "video card and font setup"
Info "sudo manjaro-settings-manager\n"

Info "ssh for git"
Info "ssh-keygen -t rsa -C "pacmanzou@qq.com""
Info "Copy the public key to the Web page"
Info "test: ssh -T git@github.com\n"

Info "https for git by using token"
Info "git clone https://github.com/pacmanzou/personal $HOME/personal/"
Info "copy the token on the Web page to fill in the password\n"

Info "mariadb"
Info "sudo pacman -S mariadb\n"

Info "neomutt"
Info "mw -a you@email.com\n"

Info "### appimage ###"
Info "beekeeper"
