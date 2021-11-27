" Clear end of line space
" ---
"
" Commands:
" - ClearSpaces

if exists('g:loaded_clearspaces')
    finish
endif
let g:loaded_clearspaces = 1

let s:ws_chars = get(g:, '', '\s')
let s:ws_pattern = get(g:, '', s:ws_chars . '\+$')

function! s:ClearSpaces(line1, line2)
    let l:save_cursor = getpos('.')
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/' . s:ws_pattern . '//'
    call setpos('.', l:save_cursor)
endfunction

command! -range=% ClearSpaces call <sid>ClearSpaces(<line1>, <line2>)
