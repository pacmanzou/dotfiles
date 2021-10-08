nnoremap <silent><space>e :PainterEraseLine<cr>
nnoremap <silent><space>E :PainterEraseAll<cr>

vnoremap <silent>p :<c-u>call codepainter#paintText(visualmode())<cr>
