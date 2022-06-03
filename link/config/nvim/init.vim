" Author: pacmanzou <pacmanzou@qq.com>
" Github: https://github.com/pacmanzou
" Description: Nvim config

" set encoding
scriptencoding utf-8

" provider
let g:loaded_node_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_python_provider = 0
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

" leader
let mapleader = ","

" plugins
source $HOME/.config/nvim/config/plugins.vim

" basic setup
source $HOME/.config/nvim/config/settings.vim
source $HOME/.config/nvim/config/mappings.vim

" colorscheme
colorscheme pacmanzou
