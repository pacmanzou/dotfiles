" go
autocmd FileType go setlocal noexpandtab

" markdown
autocmd BufReadPre,BufNewFile *.md setlocal spell spelllang=en_us,cjk

nnoremap <silent><c-g>s :setlocal spell!<cr>
nnoremap <silent><c-g><c-s> :setlocal spell!<cr>

" git
autocmd FileType git nnoremap <silent><buffer>q :q<cr>

" qf
autocmd FileType qf nnoremap <silent><buffer>q :q<cr>

" hlsearch
nnoremap <silent><nowait><expr><c-g>h &hlsearch ? ":set nohlsearch<cr>" : ":set hlsearch<cr>"
nnoremap <silent><nowait><expr><c-g><c-h> &hlsearch ? ":set nohlsearch<cr>" : ":set hlsearch<cr>"

" savecursor
au BufReadPost * if line("'\"")>1 && line("'\"") <= line("$") && &filetype != 'gitcommit' | exe "normal! g'\"" | endif

" term autoinsert
autocmd TermOpen term://* startinsert
