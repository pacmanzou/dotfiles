" Theme
colorscheme gruvbox

" Leaderkey
let mapleader = ","

" Vim-plug
let g:plug_window = 'vsplit new'

" Providers
let g:python3_host_prog = '/usr/bin/python3'
let g:loaded_python_provider = 0
let g:loaded_node_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0

" Clipboard
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

" Invalidate the key map in a special filetype
autocmd BufEnter * call s:SpecialMap()

function! s:SpecialMap() abort
  if (index([''], &filetype) >= 0)
    map <buffer> <C-n> <nop>
    map <buffer> <C-p> <nop>
  endif
endfunction

" Yank highlight
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="Visual", timeout=700}

" Save the cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
