" Author: pacmanzou <pacmanzou@qq.com>
" Github: https://github.com/pacmanzou
" Description: Nvim config

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

" Leader key
let mapleader = ","

" Invalidate the key map in a special filetype
function! s:SpecialMap() abort
  if (index([''], &filetype) >= 0)
    map <buffer> <c-n> <nop>
    map <buffer> <c-p> <nop>
  endif
endfunction

autocmd BufEnter * call s:SpecialMap()

" Yank highlight
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="Visual", timeout=700}

" Save the cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Theme
colorscheme gruvbox

" Load the configuration
source $HOME/.config/nvim/config/settings.vim
source $HOME/.config/nvim/config/mappings.vim
source $HOME/.config/nvim/config/plugins.vim
