sudo pacman -Syy
sudo pacman -S archlinuxcn-keyring

sudo pacman -S yay clash-verge-rev firefox
git clone https://github.com/pacmanzou/dotfiles

sudo pacman -S neovim python-pynvim nodejs npm
sudo pacman -S zsh zsh-autosuggestions zsh-syntax-highlightings
sudo pacman -S fcitx5 fcitx5-configtool fcitx5-chinese-addons
sudo pacman -S alacritty tmux ranger fzf fd trash-cli imv neofetch
sudo pacman -S power-profiles-daemon gcolor3
sudo pacman -S gnome-shell-extension-dash-to-dock gnome-shell-extension-kimpanel-git gnome-shell-extension-pano-git

sudo pacman -Rns gnome-clocks gnome-maps gnome-weather gnome-font-viewer gnome-tour gnome-characters gnome-contacts gnome-calendar
sudo pacman -Rns epiphany

sudo pacman -S wqy-microhei ttf-hack-nerd flat-remix-git
sudo nvim /etc/locale.gen # zh_CN
sudo locale-gen

sudo nvim /etc/kernel/cmdline # quiet vt.global_cursor_default=0
su
setterm -cursor on >> /etc/issue
exit
sudo mkinitcpio -p linux
sudo systemctl start bluetooth
sudo systemctl enable bluetooth
