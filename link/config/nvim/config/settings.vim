" set
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

" undo and swap
set undofile
set undodir=$HOME/.cache/nvim/undo/
set dir=$HOME/.cache/nvim/swap/

if empty(glob('$HOME/.cache/nvim/undo'))
  silent !mkdir -p "$HOME/.cache/nvim/undo/"
endif

if empty(glob('$HOME/.cache/nvim/swap'))
  silent !mkdir -p "$HOME/.cache/nvim/swap"
endif

" statusline
function! StatusLine() abort
  let s = ''
  let s .= '%f %h%w%m%r  %{StatusDiagnostic()}'
  let s .= '%='
  let s .= '%l,%c%V          %P'

  return s
endfunction

" coc diagnostic
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

set statusline=%!StatusLine()
