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
