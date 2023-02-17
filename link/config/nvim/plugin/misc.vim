" Misc

" Save the cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Yank highlight
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="Visual", timeout=700}

" Invalidate the key map in a special filetype
function! s:SpecialMap() abort
  if (index([''], &filetype) >= 0)
    map <buffer> <c-n> <nop>
    map <buffer> <c-p> <nop>
  endif
endfunction

autocmd BufEnter * call s:SpecialMap()
