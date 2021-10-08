" Author: Zou Jiancheng <pacmanzou@qq.com>
" Github: https://github.com/pacmanzou
" Description: Nvim config

source $HOME/.config/nvim/config/settings.vim
source $HOME/.config/nvim/config/mappings.vim
source $HOME/.config/nvim/config/plugins.vim

let s:sourceList = split(globpath('$HOME/.config/nvim/config/plugins-config/', '*.vim'), '\n')

for s:item in s:sourceList
  exec 'source '. s:item
endfor

unlet s:sourceList

source $HOME/.config/nvim/config/functions.vim
source $HOME/.config/nvim/config/autocmds.vim
source $HOME/.config/nvim/config/highlights.vim
