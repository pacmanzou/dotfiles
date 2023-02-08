" Invalidate the key map in a special filetype

function! s:SpecialMap() abort
  if (index([''], &filetype) >= 0)
    map <buffer> <c-n> <nop>
    map <buffer> <c-p> <nop>
  endif
endfunction

autocmd BufEnter * call s:SpecialMap()
