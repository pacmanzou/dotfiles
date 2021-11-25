" Author: pacmanzou <pacmanzou@qq.com>
" Github: https://github.com/pacmanzou
" Description: Nvim config

" faster startup
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
let g:node_host_prog = '/usr/bin/neovim-node-host'
let g:ruby_host_prog = '$HOME/.local/share/gem/ruby/3.0.0/bin/neovim-ruby-host'

" clipboard
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

" leader key
let mapleader = ","

" colorscheme
colorscheme pacmanzou

" source plugins
source $HOME/.config/nvim/config/plugins.vim

" source basic setup
source $HOME/.config/nvim/config/settings.vim
source $HOME/.config/nvim/config/mappings.vim
source $HOME/.config/nvim/config/autocmds.vim
