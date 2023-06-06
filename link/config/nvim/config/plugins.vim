" Plugins
if empty(glob('$HOME/.config/nvim/plugged/coc.nvim'))
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim-plug
call plug#begin('$HOME/.config/nvim/plugged')
" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
      \ 'coc-go',
      \ 'coc-clangd',
      \ 'coc-pyright',
      \ 'coc-lua',
      \ 'coc-sh',
      \ 'coc-diagnostic',
      \ 'coc-json',
      \ 'coc-yaml',
      \ 'coc-vimlsp',
      \ 'coc-docker',
      \ 'coc-sql',
      \ 'coc-tsserver',
      \ 'coc-html',
      \ 'coc-htmlhint',
      \ 'coc-css',
      \ 'coc-vetur',
      \ 'coc-emmet',
      \ 'coc-gitignore',
      \ 'coc-snippets',
      \ 'coc-prettier',
      \ 'coc-lists',
      \ 'coc-git',
      \ 'coc-highlight',
      \ 'coc-translator',
      \ 'coc-explorer',
      \ 'coc-leetcode'
      \ ]

" Coc-explorer
nmap <silent> <space>e :CocCommand explorer<cr>

" Coc-translate
nmap <silent> t <plug>(coc-translator-e)
vmap <silent> t <plug>(coc-translator-ev)

" Coc-leetcode
nmap <silent> <leader>l :CocList LeetcodeProblems<cr>
nmap <silent> <leader>r :CocCommand leetcode.run<cr>
nmap <silent> <leader>s :CocCommand leetcode.submit<cr>

" Coc-git
" Create text object for git chunk
omap <silent> ig <plug>(coc-git-chunk-inner)
xmap <silent> ig <plug>(coc-git-chunk-inner)
omap <silent> ag <plug>(coc-git-chunk-outer)
xmap <silent> ag <plug>(coc-git-chunk-outer)

" Navigate git chunks of current buffer
nmap <silent> ]g <plug>(coc-git-nextchunk)
nmap <silent> [g <plug>(coc-git-prevchunk)

" Navigate git conflicts of current buffer
nmap <silent> ]c <plug>(coc-git-nextconflict)
nmap <silent> [c <plug>(coc-git-prevconflict)

nnoremap <silent> <space>a :CocCommand git.chunkStage<cr>
nnoremap <silent> <space>u :CocCommand git.chunkUndo<cr>
nnoremap <silent> <space>p :CocCommand git.chunkInfo<cr>

" Rename
nmap <silent> cr <plug>(coc-rename)

" Apply codeAction, need lsp to support
xmap <silent> <cr> <plug>(coc-codeaction-selected)

" Code navigation
let g:coc_enable_locationlist = 0

nmap <silent> gd <plug>(coc-definition)
nmap <silent> gr <plug>(coc-references)
nmap <silent> gt <plug>(coc-type-definition)
nmap <silent> gi <plug>(coc-implementation)

autocmd User CocLocationsChange CocList --auto-preview location

" Diagnostic jump
nmap <silent> ]d <plug>(coc-diagnostic-next)
nmap <silent> [d <plug>(coc-diagnostic-prev)

" Jump previewd chunk
nmap <silent> <c-o> <plug>(coc-float-jump)

"Preview windows move
inoremap <silent><expr> <c-j> coc#float#scroll(1)
inoremap <silent><expr> <c-k> coc#float#scroll(0)

" Coclist
nnoremap <silent> <space>c :CocCommand<cr>
nnoremap <silent> <space>l :CocList<cr>

" CocCommand
nnoremap <silent> <space>d :CocList diagnostics<cr>
nnoremap <silent> <space>f :CocList files<cr>
nnoremap <silent> <space>w :CocList words<cr>
nnoremap <silent> <space>m :CocList mru -A<cr>
nnoremap <silent> <space>b :CocList buffers<cr>
nnoremap <silent> <space>g :CocList bcommits<cr>
nnoremap <silent> <space>h :CocList gchunks<cr>

" Multi cursors
nnoremap <silent><expr> <c-s> <SID>select_current_word()
nnoremap <silent> <c-q> <plug>(coc-cursors-word)

function! s:select_current_word()
  if !get(b:, 'coc_cursors_activated', 0)
    return "\<plug>(coc-cursors-word)"
  endif
  return "*\<plug>(coc-cursors-word):nohlsearch\<cr>"
endfunction

" Show documentation
nnoremap <silent> gh :call <SID>show_documentation()<cr>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" Autocmd
autocmd BufWritePre *.go silent call CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufWritePre *.go silent call CocAction('runCommand', 'editor.action.formatDocument')
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
autocmd CursorHold *
      \ if !empty(glob('$HOME/.config/nvim/plugged/coc.nvim')) |
      \ silent call CocActionAsync('highlight') |
      \ endif

" Indent line
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '|'
let g:indentLine_first_char = '|'
let g:indentLine_setColors = 0
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_bufTypeExclude = ['help']
let g:indentLine_bufNameExclude = ['_.*', 'term://.*', 'man://.*']
let g:indentLine_fileTypeExclude = [
      \ 'go',
      \ 'txt',
      \ 'help',
      \ 'coc-explorer',
      \ 'vista'
      \ ]

" For vim-surround
Plug 'tpope/vim-repeat'

" Pairs
Plug 'jiangmiao/auto-pairs'

" Comment
Plug 'tomtom/tcomment_vim'

" Sudo
Plug 'lambdalisue/suda.vim'

" Make the text alignment quickily
Plug 'junegunn/vim-easy-align'
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" Tag
Plug 'liuchengxu/vista.vim'
let g:vista#renderer#enable_icon = 0
nnoremap <silent> <space>v :Vista!!<cr>

" Float terminal
Plug 'voldikss/vim-floaterm'
let g:floaterm_borderchars = ""
let g:floaterm_opener = "tabe"
let g:floaterm_width = 3.0
let g:floaterm_height = 3.0

nnoremap <silent> <c-g><cr> :FloatermNew zsh<cr>
nnoremap <silent> <c-g>p :FloatermToggle<cr>
tnoremap <silent> <c-g>p <cmd>FloatermToggle<cr>
nnoremap <silent> <c-g>l :FloatermNew lazygit<cr>
nnoremap <silent> <c-g>r :FloatermNew ranger<cr>
nnoremap <silent> <c-g>n :FloatermNew neomutt<cr>
nnoremap <silent> <c-g>h :FloatermNew htop<cr>


" Markdown
Plug 'mzlogin/vim-markdown-toc', {'for': 'markdown'}
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install',
      \ 'for': 'markdown'
      \ }
let g:mkdp_theme = 'light'
let g:vmt_list_item_char = '-'
let g:vmt_auto_update_on_save = 0

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
call plug#end()
