" Nicebolck
function! s:Force_blockwise(next_key) abort
  return s:setup_keyseq_table[a:next_key][mode()]
endfunction

let s:setup_keyseq_table = {
\ 'I': {'v': "\<C-v>I", 'V': "\<C-v>^o^I", "\<C-v>": 'I'},
\ 'A': {'v': "\<C-v>A", 'V': "\<C-v>0o$A", "\<C-v>": 'A'},
\ }

vnoremap <expr> <Plug>(niceblock-I)  <SID>Force_blockwise('I')
vnoremap <expr> <Plug>(niceblock-A)  <SID>Force_blockwise('A')

silent! xmap <unique> I  <Plug>(niceblock-I)
silent! xmap <unique> A  <Plug>(niceblock-A)
