# Dotfiles

Some useful configs for manjaro i3.

<!-- vim-markdown-toc GFM -->

- [Auto configuration](#auto-configuration)
- [Manual configuration](#manual-configuration)
  - [Yay](#yay)
  - [SSH for git](#ssh-for-git)
  - [Video card and font](#video-card-and-font)
  - [Database](#database)
  - [Mail](#mail)
  - [Utools plugins](#utools-plugins)
  - [Appimage](#appimage)

<!-- vim-markdown-toc -->

## Auto configuration

`git clone https://github.com/pacmanzou/dotfiles`

- `sudo -E pacman-mirrors -i -c China -m rank`
- `sudo -E bash manjaro_install.sh`
- `sudo -E bash key.sh`
- `i3exit logout`

## Manual configuration

> Private need github token

**`git clone https://github.com/pacmanzou/personal`**

### Yay

> Need to configure the clash

```bash
yay -S abook \
    apifox \
    baidunetdisk-bin \
    debtap \
    google-chrome \
    linuxqq-appimage \
    mutt-wizard \
    simple-mtpfs \
    sqls \
    wps-office-cn \
    wps-office-mui-zh-cn \
    wps-office-fonts \
    wps-office-mime-cn \
    yesplaymusic
```

### SSH for git

- `ssh-keygen -t rsa -C "pacmanzou@qq.com"`
- Copy the public key to the web page
- `ssh -T git@github.com`

### Video card and font

`sudo manjaro-settings-manager`

### Database

`sudo pacman -S mariadb`

### Mail

`mw -a pacmanzou@qq.com`

### Utools plugins

```txt
- 网页快开 (跟随主程序同时启动)
- 翻译 (跟随主程序同时启动)
- 图kk床 (隐藏后台时完全退出)
- OCR-图片转文字 (隐藏后台时完全退出)
- 易翻翻译 (隐藏后台时完全退出)
- 计算稿纸 (隐藏后台时完全退出)
- hosts 切换 (隐藏后台时完全退出)
- 程序员手册 (隐藏后台时完全退出)
- Ctool (隐藏后台时完全退出)
```

### Appimage

<!-- - apifox -->
