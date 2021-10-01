#!/usr/bin/env bash
#
# Copyright (C) 2020 Zou Jiancheng <pacmanzou@qq.com>
#
# Description: install
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
    exit
else
    Success "Successful open script\n"
fi

# link
Info "### link to $HOME/.config/ ###"
FileHandler "$HOME/dotfiles/link/home/.* $HOME/dotfiles/link/home/*" "$HOME/.* $HOME/*" LinkHandler
FileHandler "$HOME/dotfiles/link/config/*" "$HOME/.config/*" LinkHandler
FileHandler "$HOME/dotfiles/link/bin/*" "/usr/local/bin/*" LinkHandler
FileHandler "$HOME/dotfiles/link/etc/*" "/etc/*" LinkHandler

echo

# copy
Info "### copy to $HOME/.config/ ###"
FileHandler "$HOME/dotfiles/copy/config/*" "$HOME/.config/*" CopyHandler

echo

# update
Info "### update systemctl ###"
sudo pacman-mirrors -i -c China -m rank
sudo pacman -Syy
sudo pacman -S archlinuxcn-keyring
sudo pacman -Syu

# install
sudo pacman -S alacritty \
    astyle \
    bleachbit \
    ctags \
    copyq \
    cmake \
    docker \
    dbeaver \
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
    npm \
    neovim \
    neomutt \
    obs-studio \
    python-pip \
    python2-pip \
    prettier \
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
    youtube-dl \
    you-get \
    yay \
    yarn \
    zip \
    zathura \
    zathura-pdf-mupdf

yay -S abook \
    apipost-bin \
    com.qq.im.deepin \
    debtap \
    google-chrome \
    pgformatter-git \
    ranger-git \
    simple-mtpfs \
    sqls \
    wechat-uos \
    wps-office-cn \
    wps-office-mui-zh-cn \
    wps-office-fonts \
    wps-office-mime-cn
Info "### install end ###\n"

# let $HOME/.local/share/fcitx5 is exist
fcitx_start() {
    fcitx5 &
    Success "success start fcitx5\n"
    sleep 3
    killall fcitx5
    Success "success kill fcitx5\n"
}

fcitx_start

# npm set registry by nrm
Info "### npm set ###"
sudo npm --registry https://registry.npm.taobao.org install -g nrm

if nrm use taobao; then
    Success "npm config set registry https://registry.npm.taobao.org\n"
else
    Fail "npm config set registry https://registry.npm.taobao.org\n"
fi

Info "### npm install ###"
sudo npm install -g neovim
sudo npm install -g reveal-md
sudo npm install -g js-beautify

echo

Info "### pip install ###"
/usr/bin/python2 -m pip install pynvim
pip install pynvim
pip install black
pip install mycli

echo

Info "### yarn and gem ###"
yarn global add neovim
gem install neovim

echo

# misc
Info "### misc ###"
CopyHandler "$HOME/dotfiles/misc/evdev" "/usr/share/X11/xkb/keycodes/evdev"
CopyHandler "$HOME/dotfiles/misc/default.yaml" "$HOME/.local/share/fcitx5/rime/build/default.yaml"
CopyHandler "$HOME/dotfiles/misc/theme.conf" "$HOME/.local/share/fcitx5/themes/default/theme.conf"
CopyHandler "$HOME/dotfiles/misc/UPower.conf" "/etc/UPower/UPower.conf"
CopyHandler "$HOME/dotfiles/misc/logind.conf" "/etc/systemd/logind.conf"

echo

# message info
Info "### manual configuration ###"
Info "ssh(git)"
Info "ssh-keygen -t rsa -C "pacmanzou@qq.com""
Info "将公钥复制到github网页端"
Info "测试是否成功: ssh -T git@github.com\n"

Info "mysql"
Info "sudo pacman -S mysql\n"

Info "neomutt"
Info "https://github.com/LukeSmithxyz/mutt-wizard\n"

Info "### debtap 构建 ###"

Info "UTools"
