#!/usr/bin/env bash
#
# Copyright (C) 2020 pacmanzou <pacmanzou@qq.com>
#
# Description: An installation script for manjaro-i3 community edition, applies to i3 only.
#

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

Info "### update systemctl ###"
sudo pacman-mirrors -i -c China -m rank
sudo pacman -Syy
sudo pacman -S archlinuxcn-keyring
sudo pacman -Syu
sudo pacman -S alacritty \
    bleachbit \
    bluez \
    bluez-utils \
    blueman \
    ctags \
    copyq \
    cmake \
    docker \
    exa \
    etcher \
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
    manjaro-settings-manager \
    materiav2-gtk-theme \
    music-dl \
    neofetch \
    nodejs-lts-fermium \
    cht.sh \
    npm6 \
    neovim \
    neomutt \
    obs-studio \
    python-pip \
    prettier \
    ripgrep \
    rar \
    seahorse \
    shellcheck \
    shfmt \
    typespeed \
    viewnior \
    tmux \
    ttf-hack \
    unzip \
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

yay -S abook \
    apipost-bin \
    baidunetdisk-electron \
    com.qq.im.deepin \
    debtap \
    google-chrome \
    mutt-wizard \
    mindmaster_cn \
    pgformatter-git \
    ranger-git \
    simple-mtpfs \
    sqls \
    wechat-uos \
    wps-office-cn \
    wps-office-mui-zh-cn \
    wps-office-fonts \
    wps-office-mime-cn

Info "### npm install ###"
sudo npm install -g js-beautify \
    markdownlint-cli \
    reveal-md
echo

Info "### pip install ###"
pip install black \
    mycli \
    pynvim
echo

Info "### go install ###"
go install mvdan.cc/gofumpt@latest
go install github.com/cweill/gotests/...@latest
echo

# misc
Info "### misc ###"
# let $HOME/.local/share/fcitx5 is exist
fcitx5 &>/dev/null
sleep 3
killall fcitx5

CopyHandler "$HOME/dotfiles/misc/default.yaml" "$HOME/.local/share/fcitx5/rime/build/default.yaml"
CopyHandler "$HOME/dotfiles/misc/theme.conf" "$HOME/.local/share/fcitx5/themes/default/theme.conf"
CopyHandler "$HOME/dotfiles/misc/evdev" "/usr/share/X11/xkb/keycodes/evdev"
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

Info "mysql"
Info "sudo pacman -S mysql\n"

Info "neomutt"
Info "mw -a you@email.com\n"

Info "### deb ###"
Info "utools\n"

Info "### appimage ###"
Info "beekeeper"
