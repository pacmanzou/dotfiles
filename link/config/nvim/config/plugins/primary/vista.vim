let g:vista_sidebar_position = 'vertical botright'
let g:vista_sidebar_width = 35
let g:vista#renderer#enable_icon = 0
let g:vista_default_executive = 'coc'
let g:vista_executive_for = { 'markdown': 'toc', }

nnoremap <silent> <space>v :Vista!!<cr>

autocmd FileType vista map <buffer> <c-p> <nop>
