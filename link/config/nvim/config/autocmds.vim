" Go_noexpandtab:
autocmd FileType go setlocal noexpandtab


" Markdown_spell:
autocmd BufReadPre,BufNewFile *.md setlocal spell spelllang=en_us,cjk

nnoremap <silent><c-g>s <cmd>setlocal spell!<cr>
nnoremap <silent><c-g><c-s> <cmd>setlocal spell!<cr>


" Hlsearch:
autocmd BufReadPre * setlocal nohlsearch

nnoremap <silent><nowait><expr><c-g>h &hlsearch ? "<cmd>set nohlsearch<cr>" : "<cmd>set hlsearch<cr>"
nnoremap <silent><nowait><expr><c-g><c-h> &hlsearch ? "<cmd>set nohlsearch<cr>" : "<cmd>set hlsearch<cr>"


" SaveCursor:
au BufReadPost * if line("'\"")>1 && line("'\"") <= line("$") && &filetype != 'gitcommit' | exe "normal! g'\"" | endif
