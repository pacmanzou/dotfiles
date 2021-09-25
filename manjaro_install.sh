#!/usr/bin/env bash

set -e

file="${HOME}/.gitconfig"
if [[ -f "${file}" ]]; then
	echo If you want to run this script, remove the .gitconfig!
	exit
fi

echo cp some####################################################################################################################################
sudo cp -b "${HOME}"/dotfiles/etc/pacman.conf /etc/
sudo cp -b "${HOME}"/dotfiles/etc/UPower/UPower.conf /etc/UPower/
sudo cp -b "${HOME}"/dotfiles/etc/systemd/logind.conf /etc/systemd/
sudo cp -b "${HOME}"/dotfiles/etc/systemd/logind.conf /etc/systemd/

sudo cp -b ~/dotfiles/misc/evdev /usr/share/X11/xkb/keycodes/
echo cp some done####################################################################################################################################

echo

echo update system####################################################################################################################################...
sudo pacman-mirrors -i -c China -m rank
sudo pacman -Syy
sudo pacman -S archlinuxcn-keyring
sudo pacman -Syu
echo update system done####################################################################################################################################

echo

echo ln usr/local/bin####################################################################################################################################
sudo ln -s "${HOME}"/dotfiles/usr/local/bin/* /usr/local/bin/
echo ln usr/local/bin done####################################################################################################################################

echo

echo ln .config####################################################################################################################################
folder="${HOME}/.i3"
if [[ -d "${folder}" ]]; then
	mv "${HOME}"/.i3/ "${HOME}"/.i3_backup/
fi
ln -s "${HOME}"/dotfiles/pacmanzou/.i3/ "${HOME}"/

file="${HOME}/.zshrc"
if [[ -f "${file}" ]]; then
	mv "${HOME}"/.zshrc "${HOME}"/.zshrc_backup
fi
ln -s "${HOME}"/dotfiles/pacmanzou/.zshrc "${HOME}"/

mv "${HOME}"/.config/ "${HOME}"/.config_backup/
mkdir "${HOME}"/.config/

ln -s "${HOME}"/dotfiles/pacmanzou/.config/* "${HOME}"/.config/
ln -s "${HOME}"/dotfiles/pacmanzou/.gitconfig "${HOME}"/
ln -s "${HOME}"/dotfiles/pacmanzou/.pip/ "${HOME}"/
ln -s "${HOME}"/dotfiles/pacmanzou/.i3status.conf "${HOME}"/
ln -s "${HOME}"/dotfiles/pacmanzou/.pam_environment "${HOME}"/
ln -s "${HOME}"/dotfiles/pacmanzou/.tmux.conf "${HOME}"/
ln -s "${HOME}"/dotfiles/pacmanzou/.urlview "${HOME}"/
echo ln .config done####################################################################################################################################

echo

echo cp config####################################################################################################################################
sudo cp -r "${HOME}"/dotfiles/config/copyq/ "${HOME}"/.config/
sudo cp -r "${HOME}"/dotfiles/config/VNote/ "${HOME}"/.config/
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
	seahorse \
	shellcheck \
	sxiv \
	tmux \
	unrar \
	unzip  \
	vnote-git \
	virtualbox \
	xclip \
	xorg-xinput \
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
	simple-mtpfs \
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
echo 将公钥复制到github网页端
echo 测试是否成功: ssh -T git@github.com

echo

echo 需要网页端安装####################################################################################################################################
echo ApiPost, uTools

echo

echo misc####################################################################################################################################
echo 配置neomutt
