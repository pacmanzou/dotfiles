" Nicebolck
function! s:Force_blockwise(next_key) abort
  return s:setup_keyseq_table[a:next_key][mode()]
endfunction

let s:setup_keyseq_table = {
\ 'I': {'v': "\<C-v>I", 'V': "\<C-v>^o^I", "\<C-v>": 'I'},
\ 'A': {'v': "\<C-v>A", 'V': "\<C-v>0o$A", "\<C-v>": 'A'},
\ }

vnoremap <expr> <plug>(niceblock-I)  <sid>Force_blockwise('I')
vnoremap <expr> <plug>(niceblock-A)  <sid>Force_blockwise('A')

silent! xmap <unique> I  <plug>(niceblock-I)
silent! xmap <unique> A  <plug>(niceblock-A)
