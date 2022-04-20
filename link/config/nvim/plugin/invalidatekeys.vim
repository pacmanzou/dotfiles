" Invalidate the key map in a special filetype

function! s:SpecialMap() abort
    if (index([''], &filetype) >= 0)
        map <buffer> <c-n>  <nop>
        map <buffer> <c-p>  <nop>
    elseif (index(['list'], &filetype) >= 0)
        map      <buffer> <c-n> <nop>
        map      <buffer> <c-p> <nop>
        nnoremap <buffer> <c-d> <c-d>
        nnoremap <buffer> <c-u> <c-u>
        nnoremap <buffer> <c-b> <c-b>
        nnoremap <buffer> <c-f> <c-f>
    else
        return
    endif
endfunction

autocmd BufEnter * call s:SpecialMap()