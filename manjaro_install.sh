#!/usr/bin/env bash
# Copyright (C) 2020 pacmanzou <pacmanzou@qq.com>
# Description: An installation script for manjaro-i3 community edition, applies to i3 only

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

# Link
Info "### Link to ... ###"
FileHandler "$HOME/dotfiles/link/home/.* $HOME/dotfiles/link/home/*" "$HOME/.* $HOME/*" LinkHandler
FileHandler "$HOME/dotfiles/link/config/*" "$HOME/.config/*" LinkHandler
FileHandler "$HOME/dotfiles/link/bin/*" "/usr/local/bin/*" LinkHandler
echo

# Copy
Info "### Copy to ... ###"
FileHandler "$HOME/dotfiles/copy/home/.* $HOME/dotfiles/copy/home/*" "$HOME/.* $HOME/*" CopyHandler
FileHandler "$HOME/dotfiles/copy/config/*" "$HOME/.config/*" CopyHandler
FileHandler "$HOME/dotfiles/copy/etc/*" "/etc/*" CopyHandler
echo

# Misc
CopyHandler "$HOME/dotfiles/misc/UPower.conf" "/etc/UPower/UPower.conf"
CopyHandler "$HOME/dotfiles/misc/logind.conf" "/etc/systemd/logind.conf"
CopyHandler "$HOME/dotfiles/misc/clash.service" "/etc/systemd/system/clash.service"
echo

# Remove
sudo pacman -Rns nano \
	palemoon-bin \
	xfce4-power-manager \
	epdfview \
	clipit \
	kvantum-manjaro \
	gcolor3 \
	morc_menu \
	mousepad \
	volumeicon \
	bmenu \
	xterm

Info "### Update system ###"
sudo pacman-mirrors -i -c China -m rank
sudo pacman -Syy
sudo pacman -S archlinuxcn-keyring
sudo pacman -Syu

# Install
sudo pacman -S alacritty \
	baidupcs-go \
	bash-language-server \
	bleachbit \
	bluez \
	bluez-utils \
	blueman \
	clash \
	ctags \
	copyq \
	cmake \
	dbeaver \
	dunst \
	docker \
	exa \
	fd \
	fzf \
	firefox \
	fcitx5 \
	fcitx5-chinese-addons \
	fcitx5-configtool \
	go \
	gopls \
	gcc \
	gparted \
	htop \
	java-openjfx \
	jdk-openjdk \
	jre-openjdk \
	lightdm-settings \
	lazygit \
	lazydocker \
	lux-dl \
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
	neovide \
	neomutt \
	obs-studio \
	pcmanfm-gtk3 \
	python-pip \
	qbittorrent \
	ripgrep \
	rar \
	scrcpy \
	seahorse \
	shellcheck \
	speedtest-cli \
	shfmt \
	telegram-desktop \
	tldr \
	viewnior \
	tmux \
	trash-cli \
	ttf-hack \
	unzip \
	utools \
	vnote-git \
	wqy-microhei \
	xclip \
	yarn \
	yay \
	zip \
	zathura \
	zathura-pdf-mupdf

# Kvm the virtual machine
sudo pacman -S qemu \
	libvirt \
	ovmf \
	virt-manager \
	virt-viewer \
	vde2

Info "### Go install ###"
go install mvdan.cc/gofumpt@latest
go install github.com/cweill/gotests/...@latest
echo

Info "### Pip install ###"
pip install black \
	pynvim
echo

Info "### Npm install ###"
sudo npm install -g json-server \
	reveal-md
echo

# Delete
trash-put "$HOME/.config/hexchat" \
	"$HOME/.config/falkon" \
	"$HOME/.config/clipit" \
	"$HOME/.config/epdfview" \
	"$HOME/.config/morc_menu" \
	"$HOME/.config/xfce4" \
	"$HOME/.config/Kvantum" \
	"$HOME/.config/volumeicon"
