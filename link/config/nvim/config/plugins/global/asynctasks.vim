let g:asynctasks_term_pos = 'bottom'
let g:asynctasks_term_focus = 1
let g:asynctasks_term_reuse = 0
let g:asynctasks_term_rows = 10    " set height for the horizontal terminal split
let g:asynctasks_term_cols = 80    " set width for vertical terminal split

nnoremap <silent><space>r :AsyncTask run<cr>
nnoremap <space>R :AsyncTask<space>
