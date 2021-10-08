let g:neoterm_autoscroll = 1
let g:floaterm_borderchars = ['─', '│', '─', '│', '┌', '┐', '┘', '└']
let g:floaterm_width = 0.99
let g:floaterm_height = 0.99
let g:floaterm_title = ''

autocmd FileType floaterm map <c-p> <nop>
autocmd TermOpen term://* startinsert

nnoremap <silent><c-g>p :FloatermToggle<cr>
nnoremap <silent><c-g><c-p> :FloatermToggle<cr>
nnoremap <silent><c-g>n :FloatermNew<cr>
nnoremap <silent><c-g><c-n> :FloatermNew<cr>
nnoremap <silent><c-g>l :FloatermNew lazygit<cr>
nnoremap <silent><c-g><c-l> :FloatermNew lazygit<cr>
nnoremap <silent><c-g>t :FloatermNew htop<cr>
nnoremap <silent><c-g><c-t> :FloatermNew htop<cr>
nnoremap <silent><c-g>r :FloatermNew ranger<cr>
nnoremap <silent><c-g><c-r> :FloatermNew ranger<cr>
nnoremap <silent><c-g><space> :CocList floaterm<cr>

tnoremap <silent><c-o> <c-\><c-n>
tnoremap <silent><c-g><tab> <cmd>FloatermNext<cr>
tnoremap <silent><c-g><s-tab> <cmd>FloatermNext<cr>
tnoremap <silent><c-g>p <cmd>FloatermToggle<cr>
tnoremap <silent><c-g><c-p> <cmd>FloatermToggle<cr>
