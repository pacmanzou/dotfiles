sudo pacman -Syy
sudo pacman -S archlinuxcn-keyring

sudo pacman -S yay clash-verge-rev firefox
git clone https://github.com/pacmanzou/dotfiles

sudo pacman -S neovim python-pynvim nodejs npm
sudo pacman -S zsh zsh-autosuggestions zsh-syntax-highlightings
sudo pacman -S fcitx5 fcitx5-configtool fcitx5-chinese-addons
sudo pacman -S alacritty tmux fzf fd ripgrep neofetch
sudo pacman -S ranger ueberzugpp mpv atool 7zip unrar trash-cli
sudo pacman -S alsa-utils brightnessctl
sudo pacman -S wqy-microhei ttf-hack-nerd
sudo pacman -S flameshot pcmanfm dunst
sudo pacman -S lazygit youtube-dl-git
sudo pacman -S gopls
sudo nvim /etc/locale.gen # zh_CN
sudo locale-gen

sudo nvim /etc/kernel/cmdline # quiet vt.global_cursor_default=0
su
setterm -cursor on >> /etc/issue
sudo mkinitcpio -p linux

sudo systemctl start bluetooth
sudo systemctl enable bluetooth
