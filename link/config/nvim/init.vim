" Author: pacmanzou <pacmanzou@qq.com>
" Github: https://github.com/pacmanzou
" Description: Nvim config

" Encoding
scriptencoding utf-8

" Theme
colorscheme gruvbox

" Providers
let g:loaded_node_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_python_provider = 0
let g:python3_host_prog = '/usr/bin/python3'

" Clipboard settings
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

" Leader key
let mapleader = ","

" Source basic and plugins's configs
source $HOME/.config/nvim/config/settings.vim
source $HOME/.config/nvim/config/mappings.vim
source $HOME/.config/nvim/config/plugins.vim
