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

" Settings
set autochdir
set clipboard=unnamedplus
set completeopt-=preview
set expandtab
set foldmethod=indent
set fileencodings=utf-8,gbk,ucs-bom,cp936
set foldlevel=99
set hidden
set ignorecase
set listchars=tab:\|\ ,trail:▫
set list
set magic
set matchpairs+=<:>
set matchpairs+=《:》
set matchpairs+=（:）
set matchpairs+=【:】
set matchpairs+=“:”
set matchpairs+=‘:’
set mouse+=a
set nohlsearch
set notimeout
set nowritebackup
set number
set scrolloff=5
set shiftwidth=2
set shortmess+=c
set smartcase
set smartindent
set softtabstop=2
set splitbelow
set splitright
set termguicolors
set tabstop=2
set updatetime=100

" Undo and swap
set undofile
set undodir=$HOME/.cache/nvim/undo/
set dir=$HOME/.cache/nvim/swap/

if empty(glob('$HOME/.cache/nvim/undo'))
  silent !mkdir -p "$HOME/.cache/nvim/undo"
endif

if empty(glob('$HOME/.cache/nvim/swap'))
  silent !mkdir -p "$HOME/.cache/nvim/swap"
endif

" StatusLine with coc.nvim
set statusline=%!StatusLine()

function! StatusLine() abort
  let s = ''
  let s .= '%f %h%w%m%r  %{StatusDiagnostic()}'
  let s .= '%=%{StatusGit()}          '
  let s .= '%l,%c%V          %P'
  return s
endfunction

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  let msgs = []

  if empty(info) | return '' | endif

  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'].' ')
  endif
  if get(info, 'hint', 0)
    call add(msgs, 'H' . info['hint'].' ')
  endif
  if get(info, 'info', 0)
    call add(msgs, 'I' . info['info'].' ')
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs,'')
endfunction

function! StatusGit() abort
  let status = get(b:, 'coc_git_status', '')
  return status
endfunction
