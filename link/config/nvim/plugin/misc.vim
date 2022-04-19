" Save the cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Yank highlight
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="Visual", timeout=700}
