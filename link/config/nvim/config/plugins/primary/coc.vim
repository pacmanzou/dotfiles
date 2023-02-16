" Coc extensions
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

" Coc-snippets
imap <silent><expr> <c-l> coc#pum#visible() ? "\<c-y>" : "\<plug>(coc-snippets-expand)"
" Coc-explorer
nmap <silent> <space>e :CocCommand explorer --sources=file+<cr>

" Coc-translate
nmap <silent> t <plug>(coc-translator-e)
vmap <silent> t <plug>(coc-translator-ev)

" Coc-git
" Create text object for git hunk
omap <silent> ih <plug>(coc-git-chunk-inner)
xmap <silent> ih <plug>(coc-git-chunk-inner)
omap <silent> ah <plug>(coc-git-chunk-outer)
xmap <silent> ah <plug>(coc-git-chunk-outer)

" Navigate hunks of current buffer
nmap <silent> ]h <plug>(coc-git-nextchunk)
nmap <silent> [h <plug>(coc-git-prevchunk)

" Navigate conflicts of current buffer
nmap <silent> ]c <plug>(coc-git-nextconflict)
nmap <silent> [c <plug>(coc-git-prevconflict)

nnoremap <silent> <space>a :CocCommand git.chunkStage<cr>
nnoremap <silent> <space>u :CocCommand git.chunkUndo<cr>
nnoremap <silent> <space>p :CocCommand git.chunkInfo<cr>

" Coc basic config
" Use tab for trigger completion with characters ahead and navigate.
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

" Rename
nmap <silent> cr <plug>(coc-rename)

" Apply codeAction, need lsp to support
vmap <silent> <c-l> <plug>(coc-codeaction-selected)

" Go to code navigation
nmap <silent> gd <plug>(coc-definition)
nmap <silent> gr <plug>(coc-references)
nmap <silent> gt <plug>(coc-type-definition)
nmap <silent> gi <plug>(coc-implementation)

" Diagnostic jump
nmap <silent> ]d <plug>(coc-diagnostic-next)
nmap <silent> [d <plug>(coc-diagnostic-prev)

" Jump previewd chunk
nmap <silent> <c-o> <plug>(coc-float-jump)

" Coclist and coccommand
nnoremap <silent> <space>c :CocCommand<cr>
nnoremap <silent> <space>l :CocList<cr>

nnoremap <silent> <space>d :CocList diagnostics<cr>
nnoremap <silent> <space>f :CocList files<cr>
nnoremap <silent> <space>w :CocList words<cr>
nnoremap <silent> <space>m :CocList mru -A<cr>
nnoremap <silent> <space>b :CocList buffers<cr>
nnoremap <silent> <space>g :CocList bcommits<cr>
nnoremap <silent> <space>h :CocList gchunks<cr>

" Show documentation
function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nnoremap <silent> gh :call <sid>show_documentation()<cr>

" Multi cursors
function! s:select_current_word()
  if !get(b:, 'coc_cursors_activated', 0)
    return "\<plug>(coc-cursors-word)"
  endif
  return "*\<plug>(coc-cursors-word):nohlsearch\<cr>"
endfunction

nnoremap <silent> <c-q> <plug>(coc-cursors-word)
nnoremap <expr><silent> <enter> <sid>select_current_word()

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" Autocmds
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
autocmd CursorHold * silent call CocActionAsync('highlight')
