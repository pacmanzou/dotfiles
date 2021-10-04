" Author: Zou Jiancheng <pacmanzou@qq.com>
" Github: https://github.com/pacmanzou
" Description: Nvim config

" let:
let &termencoding = &encoding
let mapleader = ","
let g:netrw_nogx = 1
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
let g:clipboard = {
            \ 'name': 'xsel_override',
            \ 'copy': {
            \ '+': 'xsel --input --clipboard',
            \ '*': 'xsel --input --primary',
            \ },
            \ 'paste': {
            \ '+': 'xsel --output --clipboard',
            \ '*': 'xsel --output --primary',
            \ },
            \ 'cache_enabled': 0,
            \ }

" source
source $HOME/.config/nvim/set.vim
source $HOME/.config/nvim/map.vim
source $HOME/.config/nvim/plugin.vim
source $HOME/.config/nvim/plugin_config.vim
source $HOME/.config/nvim/misc.vim
source $HOME/.config/nvim/highlight.vim
