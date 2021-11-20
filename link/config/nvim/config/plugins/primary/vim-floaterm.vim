let g:floaterm_width = 1.2
let g:floaterm_height = 1.2
let g:floaterm_title = ''
let g:floaterm_borderchars = ['','','','','','','','']

nnoremap <silent> <c-g><cr>    :FloatermNew zsh<cr>
nnoremap <silent> <c-g>p       :FloatermToggle<cr>
nnoremap <silent> <c-g><c-p>   :FloatermToggle<cr>

tnoremap <silent> <c-o>        <c-\><c-n>
tnoremap <silent> <c-g><tab>   <cmd>FloatermNext<cr>
tnoremap <silent> <c-g><s-tab> <cmd>FloatermNext<cr>
tnoremap <silent> <c-g>p       <cmd>FloatermToggle<cr>
tnoremap <silent> <c-g><c-p>   <cmd>FloatermToggle<cr>

" external
nnoremap <silent> <c-g>l     :FloatermNew lazygit<cr>
nnoremap <silent> <c-g><c-l> :FloatermNew lazygit<cr>
nnoremap <silent> <c-g>r     :FloatermNew ranger<cr>
nnoremap <silent> <c-g><c-r> :FloatermNew ranger<cr>

autocmd FileType floaterm map <buffer> <c-p> <nop>
