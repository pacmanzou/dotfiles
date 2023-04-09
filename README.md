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

<!-- vim-markdown-toc -->

## Auto configuration

`git clone https://github.com/pacmanzou/dotfiles`

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
    debtap \
    google-chrome \
    linuxqq \
    mutt-wizard \
    simple-mtpfs \
    sqls \
    wps-office-cn \
    wps-office-mui-zh-cn \
    wps-office-fonts \
    wps-office-mime-cn
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
- Ctool
- hosts 切换
- OCR-图片转文字
- 计算稿纸
- 知犀思维导图
- 网页快开
- 程序员手册
- 翻译
- 图床
- 英语单词肌肉记忆打字练习
```
