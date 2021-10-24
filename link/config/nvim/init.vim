" Author: Zou Jiancheng <pacmanzou@qq.com>
" Github: https://github.com/pacmanzou
" Description: Nvim config

" faster startup
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
let g:node_host_prog = '/usr/bin/neovim-node-host'
let g:ruby_host_prog = '$HOME/.local/share/gem/ruby/3.0.0/bin/neovim-ruby-host'

" this is to avoid a bug that completes a code snippet.
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

let &termencoding = &encoding
let mapleader = ","
let g:netrw_nogx = 1

" let the mode use English
language en_US.UTF-8

" load base files
source $HOME/.config/nvim/config/settings.vim
source $HOME/.config/nvim/config/mappings.vim
source $HOME/.config/nvim/config/statusline.vim
source $HOME/.config/nvim/config/customs.vim
source $HOME/.config/nvim/config/highlights.vim

" delay loading plugins
autocmd VimEnter * call timer_start(100, 'SourcePlugins', {'repeat': 1})

function! SourcePlugins(timer) abort
    source $HOME/.config/nvim/config/plugins.vim

    let s:sourceList = split(glob('$HOME/.config/nvim/config/plugins/*.vim'), '\n')

    for s:item in s:sourceList
        exec 'source '. s:item
    endfor
endfunction
