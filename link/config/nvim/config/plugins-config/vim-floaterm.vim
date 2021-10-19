let g:floaterm_width = 1.0
let g:floaterm_height = 1.0
let g:floaterm_title = ''

autocmd FileType floaterm map <buffer><c-p> <nop>

nnoremap <silent><c-g><cr> :FloatermNew<cr>
nnoremap <silent><c-g><space> :CocList floaterm<cr>
nnoremap <silent><c-g>p :FloatermToggle<cr>
nnoremap <silent><c-g><c-p> :FloatermToggle<cr>
nnoremap <silent><c-g>l :FloatermNew lazygit<cr>
nnoremap <silent><c-g><c-l> :FloatermNew lazygit<cr>
nnoremap <silent><c-g>n :FloatermNew neomutt<cr>
nnoremap <silent><c-g><c-n> :FloatermNew neomutt<cr>
nnoremap <silent><c-g>r :FloatermNew ranger<cr>
nnoremap <silent><c-g><c-r> :FloatermNew ranger<cr>

tnoremap <silent><c-o> <c-\><c-n>
tnoremap <silent><c-g><tab> <cmd>FloatermNext<cr>
tnoremap <silent><c-g><s-tab> <cmd>FloatermNext<cr>
tnoremap <silent><c-g>p <cmd>FloatermToggle<cr>
tnoremap <silent><c-g><c-p> <cmd>FloatermToggle<cr>
