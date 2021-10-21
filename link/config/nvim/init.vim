" Author: Zou Jiancheng <pacmanzou@qq.com>
" Github: https://github.com/pacmanzou
" Description: Nvim config

source $HOME/.config/nvim/VimL/settings.vim
source $HOME/.config/nvim/VimL/mappings.vim
source $HOME/.config/nvim/VimL/customs.vim
source $HOME/.config/nvim/VimL/plugins.vim

let s:sourceList = split(globpath('$HOME/.config/nvim/VimL/plugin-config/', '*.vim'), '\n')

for s:item in s:sourceList
    exec 'source '. s:item
endfor

unlet s:sourceList

source $HOME/.config/nvim/VimL/highlights.vim
