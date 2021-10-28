" Nicebolck

function! Force_blockwise(next_key) abort
    return s:setup_keyseq_table[a:next_key][mode()]
endfunction

let s:setup_keyseq_table = {
\   'I': {'v': "\<C-v>I", 'V': "\<C-v>^o^I", "\<C-v>": 'I'},
\   'A': {'v': "\<C-v>A", 'V': "\<C-v>0o$A", "\<C-v>": 'A'},
\ }

vnoremap <expr> <plug>(niceblock-I)  Force_blockwise('I')
vnoremap <expr> <plug>(niceblock-A)  Force_blockwise('A')

if !exists('g:niceblock_no_default_key_mappings') ||
            \ !g:niceblock_no_default_key_mappings
    silent! xmap <unique> I  <plug>(niceblock-I)
    silent! xmap <unique> A  <plug>(niceblock-A)
endif
