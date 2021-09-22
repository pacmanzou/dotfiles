#!/usr/bin/env bash

set -e

file="$HOME/.gitconfig"
if [[ -f "${file}" ]]; then
    echo If you want to run this script, remove the .gitconfig!
    exit
fi

echo cp some####################################################################################################################################
sudo cp -b ~/dotfiles/etc/pacman.conf /etc/
sudo cp -b ~/dotfiles/etc/UPower/UPower.conf /etc/UPower/
sudo cp -b ~/dotfiles/etc/systemd/logind.conf /etc/systemd/
sudo cp -b ~/dotfiles/etc/systemd/logind.conf /etc/systemd/

sudo cp -b ~/dotfiles/misc/evdev /usr/share/X11/xkb/keycodes/

sudo cp -b ~/dotfiles/usr/local/bin/D /usr/local/bin/
sudo cp -b ~/dotfiles/usr/local/bin/linkhandler /usr/local/bin/
echo cp some done####################################################################################################################################

echo

echo update system####################################################################################################################################...
sudo pacman-mirrors -i -c China -m rank
sudo pacman -Syy
sudo pacman -S archlinuxcn-keyring
sudo pacman -Syu
echo update system done####################################################################################################################################

echo

echo ln .config####################################################################################################################################
folder="$HOME/.i3"
if [[ -d "${folder}" ]]; then
    mv "$HOME"/.i3/ "$HOME"/.i3_backup/
fi
ln -s /home/zou/dotfiles/pacmanzou/.i3/ /home/zou/

file="$HOME/.zshrc"
if [[ -f "${file}" ]]; then
    mv "$HOME"/.zshrc "$HOME"/.zshrc_backup
fi
ln -s /home/zou/dotfiles/pacmanzou/.zshrc /home/zou/

mv /home/zou/.config/ /home/zou/.config_backup/
mkdir /home/zou/.config/

ln -s /home/zou/dotfiles/pacmanzou/.config/* /home/zou/.config/
ln -s /home/zou/dotfiles/pacmanzou/.gitconfig /home/zou/
ln -s /home/zou/dotfiles/pacmanzou/.pip/ /home/zou/
ln -s /home/zou/dotfiles/pacmanzou/.i3status.conf /home/zou/
ln -s /home/zou/dotfiles/pacmanzou/.pam_environment /home/zou/
ln -s /home/zou/dotfiles/pacmanzou/.tmux.conf /home/zou/
ln -s /home/zou/dotfiles/pacmanzou/.urlview /home/zou/
echo ln .config done####################################################################################################################################

echo

echo cp config####################################################################################################################################
sudo cp -r ~/dotfiles/config/copyq/ ~/.config/
sudo cp -r ~/dotfiles/config/VNote /~/.config/
echo cp config done####################################################################################################################################

echo

echo install package####################################################################################################################################
sudo pacman -S zsh \
    alacritty \
    bleachbit \
    bottom \
    ctags \
    copyq \
    cmake \
    dbeaver \
    etcher \
    fd \
    fcitx5 \
    fcitx5-rime \
    fcitx5-configtool \
    fzf \
    go \
    gcc \
    gparted \
    lightdm-settings \
    libreoffice-fresh \
    libreoffice-fresh-zh-cn \
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
    obs-studio \
    python-pip \
    python2-pip \
    pandoc \
    ruby \
    ripgrep \
    sxiv \
    tmux \
    unrar \
    unzip  \
    vnote-git \
    virtualbox \
    xclip \
    youtube-dl \
    you-get \
    yay \
    yarn \
    ydcv-rs-git  \
    zip  \
    zathura \
    zathura-pdf-mupdf

yay -S debtap \
    ranger-git \
    abook \
    google-chrome
echo install package done####################################################################################################################################

echo

echo download environment####################################################################################################################################
sudo npm install -g neovim
yarn global add neovim
pip install pynvim
/usr/bin/python2 -m pip install pynvim
echo download environment done####################################################################################################################################

echo

echo misc####################################################################################################################################
npm install -g reveal-md
echo misc done####################################################################################################################################

echo

echo 手动配置部分####################################################################################################################################
echo ssh\(git\)
echo ssh-keygen -t rsa -C "pacmanzou@qq.com"
echo ssh-add /home/zou/.ssh/id_rsa
echo 将公钥复制到github网页端
echo 测试是否成功: ssh -T git@github.com

echo

echo 需要网页端安装####################################################################################################################################
echo ApiPost, uTools

echo

echo misc####################################################################################################################################
echo 配置neomutt
