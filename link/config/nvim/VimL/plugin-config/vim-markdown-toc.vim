let g:vmt_list_item_char = '-'
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'

autocmd FileType markdown nnoremap <silent><buffer><space>i :GenTocGFM<cr>o<esc>
