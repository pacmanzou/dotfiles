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
set autoindent
set autoread
set background=dark
set clipboard=unnamedplus
set completeopt=longest,noinsert,menuone,noselect,preview
set expandtab
set fdm=indent
set fileencodings=utf-8,gbk,ucs-bom,cp936
set fillchars=stlnc:-
set foldcolumn=0
set foldenable
set foldlevel=99
set guioptions-=e
set hidden
set history=10000
set ignorecase
set incsearch
set listchars=tab:\|\ ,trail:▫
set laststatus=2
set lazyredraw
set list
set magic
set matchtime=0
set matchpairs+=<:>
set matchpairs+=《:》
set matchpairs+=（:）
set matchpairs+=【:】
set matchpairs+=“:”
set matchpairs+=‘:’
set nohlsearch
set noshowmatch
set noshowmode
set showcmd
set nospell
set nu
set notimeout
set novisualbell
set nowritebackup
set nostartofline
set ruler
set scrolloff=3
set shiftwidth=4
set shortmess+=c
set showtabline=2
set smartcase
set smartindent
set smarttab
set softtabstop=4
set splitbelow
set splitright
set syntax=off
set termguicolors
set tabstop=4
set terse
set ttimeoutlen=0
set tw=0
set updatetime=100
set wildmenu
set wrap
set wrapscan

" Undo Backup Swap:
set nobackup
set undofile
set undodir=$HOME/.cache/nvim/undo/
set swapfile
set dir=$HOME/.cache/nvim/swap/

if empty(glob('$HOME/.cache/nvim/swap'))
    silent !mkdir -p "$HOME/.cache/nvim/swap"
endif

if empty(glob('$HOME/.cache/nvim/undo'))
    silent !mkdir -p "$HOME/.cache/nvim/undo/"
endif