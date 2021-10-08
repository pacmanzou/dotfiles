let g:coc_global_extensions = [
            \ 'coc-go',
            \ 'coc-clangd',
            \ 'coc-pyright',
            \ 'coc-json',
            \ 'coc-sh',
            \ 'coc-tsserver',
            \ 'coc-html',
            \ 'coc-css',
            \ 'coc-vetur',
            \ 'coc-yaml',
            \ 'coc-docker',
            \ 'coc-markdownlint',
            \ 'coc-vimlsp',
            \ 'coc-snippets',
            \ 'coc-just-complete',
            \ 'coc-diagnostic',
            \ 'coc-gitignore',
            \ 'coc-floaterm',
            \ 'coc-lists',
            \ 'coc-yank',
            \ 'coc-translator',
            \ 'coc-explorer',
            \ 'coc-leetcode'
            \ ]

" show documentation
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

autocmd FileType help nnoremap <silent><buffer> q :q<cr>

nnoremap <silent>gh :call <sid>show_documentation()<cr>

" snippets
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'

imap <silent><nowait><expr> <C-l> coc#float#has_float() ? "\<c-y>" : "\<plug>(coc-snippets-expand)"

" explorer
nmap <silent>t :CocCommand explorer --sources=file+<cr>

" translate
nmap <silent><space>t <Plug>(coc-translator-e)

" rename
nmap <silent>cn <plug>(coc-rename)

" refactor
nmap <silent>cr <plug>(coc-refactor)

" apply codeAction
vmap <silent><c-f> <plug>(coc-codeaction-selected)

" go to code navigation
nmap <silent>gd <plug>(coc-definition)
nmap <silent>gr <plug>(coc-references)
nmap <silent>gt <plug>(coc-type-definition)
nmap <silent>gi <plug>(coc-implementation)

" diagnostic jump
nmap <silent>]d <plug>(coc-diagnostic-next)
nmap <silent>[d <plug>(coc-diagnostic-prev)

" float window scroll
nnoremap <silent><nowait><expr><c-f> coc#float#scroll(1)
nnoremap <silent><nowait><expr><c-b> coc#float#scroll(0)

" function and class
xmap <silent>if <plug>(coc-funcobj-i)
xmap <silent>af <plug>(coc-funcobj-a)
xmap <silent>ic <plug>(coc-classobj-i)
xmap <silent>ac <plug>(coc-classobj-a)

omap <silent>if <plug>(coc-funcobj-i)
omap <silent>af <plug>(coc-funcobj-a)
omap <silent>ic <plug>(coc-classobj-i)
omap <silent>ac <plug>(coc-classobj-a)

" coclist and coccommand
nnoremap <silent><space>l :CocList<cr>
nnoremap <silent><space>d :CocList diagnostics<cr>
nnoremap <silent><space>y :CocList yank<cr>
nnoremap <silent><space>f :CocList --regex files<cr>
nnoremap <silent><space>b :CocList buffers<cr>
nnoremap <silent><space>w :CocList lines<cr>
nnoremap <silent><space>g :CocList grep<cr>
nnoremap <silent><space>m :CocList marks<cr>
nnoremap <silent><space>h :CocList --regex mru -A<cr>

nnoremap <silent><space>c :CocCommand<cr>
nnoremap <silent><space>i :CocCommand editor.action.organizeImport<cr>

" autocmd for go
autocmd BufWritePre *.go silent call CocAction('runCommand', 'editor.action.organizeImport')
