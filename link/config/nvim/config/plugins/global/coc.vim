""" coc extensions load """
""
let g:coc_global_extensions = [
            \ 'coc-pyright',
            \ 'coc-json',
            \ 'coc-sh',
            \ 'coc-vimlsp',
            \ 'coc-tsserver',
            \ 'coc-html',
            \ 'coc-css',
            \ 'coc-emmet',
            \ 'coc-vetur',
            \ 'coc-clangd',
            \ 'coc-docker',
            \ 'coc-snippets',
            \ 'coc-just-complete',
            \ 'coc-markdownlint',
            \ 'coc-diagnostic',
            \ 'coc-gitignore',
            \ 'coc-lists',
            \ 'coc-git',
            \ 'coc-pairs',
            \ 'coc-floaterm',
            \ 'coc-translator',
            \ 'coc-explorer',
            \ 'coc-leetcode'
            \ ]

""" coc basci config """
""
" rename
nmap <silent>cn <plug>(coc-rename)

" apply codeAction, need lsp to support
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

" jump previewd chunk
nmap <silent><c-o> <plug>(coc-float-jump)

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
nnoremap <silent><space>f :CocList --regex files<cr>
nnoremap <silent><space>b :CocList buffers<cr>
nnoremap <silent><space>w :CocList words<cr>
nnoremap <silent><space>g :CocList grep<cr>
nnoremap <silent><space>m :CocList --regex mru -A<cr>

nnoremap <silent><space>c :CocCommand<cr>
nnoremap <silent><space>i :CocCommand editor.action.organizeImport<cr>

" show documentation
function! s:show_documentation() abort
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

nnoremap <silent>gh :call <sid>show_documentation()<cr>

" autocmd
autocmd BufWritePre *.go silent call CocAction('runCommand', 'editor.action.organizeImport')

""" coc extensions config """
""
" coc-snippets
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'

imap <silent><nowait><expr> <C-l> coc#float#has_float() ? "\<c-y>" : "\<plug>(coc-snippets-expand)"

" coc-pairs
inoremap <silent><c-m> <c-g>u<cr><c-r>=coc#on_enter()<cr>

" coc-explorer
nmap <silent><space>e :CocCommand explorer --sources=file+<cr>

" coc-translate
nmap <silent>t <Plug>(coc-translator-e)

" coc-floaterm
nnoremap <silent><c-g><space> :CocList floaterm<cr>

" coc-git
" create text object for git chunk
omap <silent>ig <Plug>(coc-git-chunk-inner)
xmap <silent>ig <Plug>(coc-git-chunk-inner)
omap <silent>ag <Plug>(coc-git-chunk-outer)
xmap <silent>ag <Plug>(coc-git-chunk-outer)

" navigate chunks of current buffer
nmap <silent>]g <plug>(coc-git-nextchunk)
nmap <silent>[g <plug>(coc-git-prevchunk)

" navigate conflicts of current buffer
nmap <silent>]c <Plug>(coc-git-nextconflict)
nmap <silent>[c <Plug>(coc-git-prevconflict)

" coclist and coccommand for coc-git
nnoremap <silent><leader>c :CocList bcommits<cr>
nnoremap <silent><leader>C :CocList commits<cr>

nnoremap <silent><leader>a :CocCommand git.chunkStage<cr>
nnoremap <silent><leader>u :CocCommand git.chunkUndo<cr>
nnoremap <silent><leader>p :CocCommand git.chunkInfo<cr>
nnoremap <silent><leader>f :CocCommand git.foldUnchanged<cr>
nnoremap <silent><leader>s :CocCommand git.showCommit<cr>
nnoremap <silent><leader>o :CocCommand git.browserOpen<cr>
