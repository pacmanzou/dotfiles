#!/usr/bin/env bash
#
# Copyright (C) 2020 Zou Jiancheng <pacmanzou@qq.com>
#
# Description: install
#

Info() {
    printf '[\033[0;38minfo\033[0m] %b\n' "$1"
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

file="${HOME}/.gitconfig"

if [[ -f "${file}" ]]; then
    Warn "If you want to run this script, please remove the .gitconfig!"
    Fail "Failed to run this script"
    exit
else
    Success "Successful open script"
fi

# link
Info "### link to ${HOME}/.config/ ###\n"

FileHandler "${HOME}/dotfiles/link/home/.* ${HOME}/dotfiles/link/home/*" "${HOME}/.* ${HOME}/*" LinkHandler
FileHandler "${HOME}/dotfiles/link/config/*" "${HOME}/.config/*" LinkHandler
FileHandler "${HOME}/dotfiles/link/bin/*" "/usr/local/bin/*" LinkHandler
FileHandler "${HOME}/dotfiles/link/etc/*" "/etc/*" LinkHandler

# copy
Info "### copy to ${HOME}/.config/ ###\n"

FileHandler "${HOME}/dotfiles/copy/config/*" "${HOME}/.config/*" CopyHandler

# update
Info "### update systemctl ###\n"

sudo pacman-mirrors -i -c China -m rank
sudo pacman -Syy
sudo pacman -S archlinuxcn-keyring
sudo pacman -Syu

# install
sudo pacman -S alacritty \
    bleachbit \
    ctags \
    copyq \
    cmake \
    dbeaver \
    exa \
    etcher \
    fd \
    fcitx5 \
    fcitx5-rime \
    fcitx5-configtool \
    fzf \
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
    npm \
    neovim \
    neomutt \
    obs-studio \
    python-pip \
    python2-pip \
    pandoc \
    ruby \
    ripgrep \
    seahorse \
    shellcheck \
    shfmt \
    sxiv \
    tmux \
    unrar \
    unzip \
    vnote-git \
    virtualbox \
    xclip \
    xorg-xinput \
    youtube-dl \
    you-get \
    yay \
    yarn \
    ydcv-rs-git \
    zip \
    zsh \
    zathura \
    zathura-pdf-mupdf

yay -S abook \
    debtap \
    google-chrome \
    ranger-git \
    simple-mtpfs \
    wps-office-cn \
    wps-office-mui-zh-cn \
    wps-office-fonts \
    wps-office-mime-cn

# neovim checkhealth
Info "### neovim environment ###\n"

sudo npm install -g neovim
yarn global add neovim
pip install pynvim
/usr/bin/python2 -m pip install pynvim

# misc
Info "### misc ###\n"

CopyHandler "${HOME}/dotfiles/misc/evdev" "/usr/share/X11/xkb/keycodes/evdev"
CopyHandler "${HOME}/dotfiles/misc/default.yaml" "${HOME}/.local/share/fcitx5/rime/build/default.yaml"
CopyHandler "${HOME}/dotfiles/misc/theme.conf" "${HOME}/.local/share/fcitx5/themes/default/theme.conf"
CopyHandler "${HOME}/dotfiles/misc/UPower.conf" "/etc/UPower/UPower.conf"
CopyHandler "${HOME}/dotfiles/misc/logind.conf" "/etc/systemd/logind.conf"

npm install -g reveal-md

Info "### manual configuration ###\n"

Info "neomutt"
Info "https://github.com/LukeSmithxyz/mutt-wizard\n"

Info "ssh(git)"
Info "ssh-keygen -t rsa -C "pacmanzou@qq.com""
Info "将公钥复制到github网页端"
Info "测试是否成功: ssh -T git@github.com\n"

Info "### web install ###\n"

Info "ApiPost"
Info "UTools"
Info "Ghelpers\n"

Success "Successful run this script"
