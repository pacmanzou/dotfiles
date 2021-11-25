" set
set autochdir
set clipboard=unnamedplus
set expandtab
set foldmethod=indent
set fileencodings=utf-8,gbk,ucs-bom,cp936
set foldlevel=99
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
set number
set scrolloff=3
set shiftwidth=4
set shortmess+=c
set smartcase
set smartindent
set signcolumn=number
set softtabstop=4
set splitbelow
set splitright
set termguicolors
set tabstop=4
set updatetime=100

" undo and swap
set undofile
set undodir=$HOME/.cache/nvim/undo/
set dir=$HOME/.cache/nvim/swap/

if empty(glob('$HOME/.cache/nvim/swap'))
    silent !mkdir -p "$HOME/.cache/nvim/swap"
endif

if empty(glob('$HOME/.cache/nvim/undo'))
    silent !mkdir -p "$HOME/.cache/nvim/undo/"
endif
