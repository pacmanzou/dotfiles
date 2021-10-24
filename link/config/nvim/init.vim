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

" language
language en_US.UTF-8

" colorscheme
colorscheme pacmanzou

" source
source $HOME/.config/nvim/config/settings.vim
source $HOME/.config/nvim/config/mappings.vim
source $HOME/.config/nvim/config/statusline.vim
source $HOME/.config/nvim/config/customs.vim
source $HOME/.config/nvim/config/plugins.vim

function! SourceList(path) abort
    let s:sourceList = a:path

    for s:item in s:sourceList
        exec 'source '. s:item
    endfor

    unlet s:item
    unlet s:sourceList
endfunction

function! LoadGlobalPlugins(timer) abort
    call plug#load(
                \ 'vim-illuminate',
                \ 'vim-hexokinase',
                \ 'surround.vim',
                \ 'vim-commentary',
                \ 'vim-abolish',
                \ 'vim-repeat',
                \ 'vim-easy-align',
                \ 'vim-exchange',
                \ 'vim-smartchr',
                \ 'vim-codepainter',
                \ 'splitjoin.vim',
                \ 'neoformat',
                \ 'vim-floaterm',
                \ 'vista.vim',
                \ 'asyncrun.vim',
                \ 'asynctasks.vim',
                \ 'coc.nvim',
                \ 'tmux-complete.vim'
                \ )

    call SourceList(split(glob('$HOME/.config/nvim/config/plugins/global/*.vim'), '\n'))
endfunction

function! LoadMarkdownPlugins(timer) abort
    call plug#load(
                \ 'vim-markdown-toc',
                \ 'md-img-paste.vim',
                \ 'markdown-preview.nvim'
                \ )

    call SourceList(split(glob('$HOME/.config/nvim/config/plugins/markdown/*.vim'), '\n'))
endfunction

call SourceList(split(glob('$HOME/.config/nvim/config/plugins/*.vim'), '\n'))

" delay load
augroup load_plugins
    autocmd!
    autocmd VimEnter * call timer_start(100, 'LoadGlobalPlugins', {'repeat': 1})
    autocmd FileType markdown call timer_start(200, 'LoadMarkdownPlugins', {'repeat': 1})
augroup END

