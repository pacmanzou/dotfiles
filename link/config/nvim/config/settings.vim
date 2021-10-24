" language
language en_US.UTF-8

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

" set
set autochdir
set background=dark
set clipboard=unnamedplus
set expandtab
set fdm=indent
set fileencodings=utf-8,gbk,ucs-bom,cp936
set foldlevel=99
set fillchars=stlnc:-
set hidden
set ignorecase
set listchars=tab:\|\ ,trail:▫
set lazyredraw
set list
set magic
set matchpairs+=<:>
set matchpairs+=《:》
set matchpairs+=（:）
set matchpairs+=【:】
set matchpairs+=“:”
set matchpairs+=‘:’
set nohlsearch
set notimeout
set nowritebackup
set scrolloff=3
set shiftwidth=4
set shortmess+=c
set smartcase
set smartindent
set signcolumn=yes
set softtabstop=4
set splitbelow
set splitright
set syntax=off
set termguicolors
set tabstop=4
set updatetime=100

" Undo Swap:
set undofile
set undodir=$HOME/.cache/nvim/undo/
set dir=$HOME/.cache/nvim/swap/

if empty(glob('$HOME/.cache/nvim/swap'))
    silent !mkdir -p "$HOME/.cache/nvim/swap"
endif

if empty(glob('$HOME/.cache/nvim/undo'))
    silent !mkdir -p "$HOME/.cache/nvim/undo/"
endif
