let g:coc_global_extensions = [
      \ 'coc-pyright',
      \ 'coc-sql',
      \ 'coc-sh',
      \ 'coc-json',
      \ 'coc-vimlsp',
      \ 'coc-tsserver',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-emmet',
      \ 'coc-vetur',
      \ 'coc-docker',
      \ 'coc-diagnostic',
      \ 'coc-htmlhint',
      \ 'coc-markdownlint',
      \ 'coc-prettier',
      \ 'coc-snippets',
      \ 'coc-gitignore',
      \ 'coc-lists',
      \ 'coc-git',
      \ 'coc-pairs',
      \ 'coc-highlight',
      \ 'coc-translator',
      \ 'coc-explorer',
      \ 'coc-leetcode'
      \ ]

" coc-snippets
imap <silent><expr> <c-l> coc#pum#visible() ? "\<c-y>" : "\<plug>(coc-snippets-expand)"
" coc-explorer
nmap <silent> <space>e :CocCommand explorer --sources=file+<cr>

" coc-translate
nmap <silent> t <plug>(coc-translator-e)

" coc-git
" create text object for git hunk
omap <silent> ih <plug>(coc-git-chunk-inner)
xmap <silent> ih <plug>(coc-git-chunk-inner)
omap <silent> ah <plug>(coc-git-chunk-outer)
xmap <silent> ah <plug>(coc-git-chunk-outer)

" navigate hunks of current buffer
nmap <silent> ]h <plug>(coc-git-nextchunk)
nmap <silent> [h <plug>(coc-git-prevchunk)

" navigate conflicts of current buffer
nmap <silent> ]c <plug>(coc-git-nextconflict)
nmap <silent> [c <plug>(coc-git-prevconflict)

nnoremap <silent> <space>a :CocCommand git.chunkStage<cr>
nnoremap <silent> <space>u :CocCommand git.chunkUndo<cr>
nnoremap <silent> <space>p :CocCommand git.chunkInfo<cr>

" coc basic config
" " use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" rename
nmap <silent> cr <plug>(coc-rename)

" apply codeAction, need lsp to support
vmap <silent> <c-l> <plug>(coc-codeaction-selected)

" go to code navigation
nmap <silent> gd <plug>(coc-definition)
nmap <silent> gr <plug>(coc-references)
nmap <silent> gt <plug>(coc-type-definition)
nmap <silent> gi <plug>(coc-implementation)

" diagnostic jump
nmap <silent> ]d <plug>(coc-diagnostic-next)
nmap <silent> [d <plug>(coc-diagnostic-prev)

" jump previewd chunk
nmap <silent> <c-o> <plug>(coc-float-jump)

" coclist and coccommand
nnoremap <silent> <space>l :CocList<cr>
nnoremap <silent> <space>d :CocList diagnostics<cr>
nnoremap <silent> <space>f :CocList --regex files<cr>
nnoremap <silent> <space>b :CocList buffers<cr>
nnoremap <silent> <space>w :CocList words<cr>
nnoremap <silent> <space>g :CocList grep<cr>
nnoremap <silent> <space>m :CocList --regex mru -A<cr>

nnoremap <silent> <space>c :CocCommand<cr>

" show documentation
function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nnoremap <silent> gh :call <sid>show_documentation()<cr>

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" autocmds
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
autocmd CursorHold * silent call CocActionAsync('highlight')
