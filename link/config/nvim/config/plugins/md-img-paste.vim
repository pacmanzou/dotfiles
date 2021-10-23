let g:mdip_imgdir = 'images'
let g:mdip_imgname = 'image'

autocmd FileType markdown nnoremap <buffer><silent><space>i :call mdip#MarkdownClipboardImage()<cr>
