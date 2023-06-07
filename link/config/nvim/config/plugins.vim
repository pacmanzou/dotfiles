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

" Coc-go
nmap <silent> <Leader>gi :CocCommand go.impl.cursor<CR>
nmap <silent> <Leader>ga :CocCommand go.tags.add.prompt<CR>
nmap <silent> <Leader>gr :CocCommand go.tags.remove.prompt<CR>
nmap <silent> <Leader>gc :CocCommand go.tags.clear<CR>

" Coc-explorer
nmap <silent> <Space>e :CocCommand explorer<CR>

" Coc-translate
nmap <silent> t <Plug>(coc-translator-e)
vmap <silent> t <Plug>(coc-translator-ev)

" Coc-git
" Create text object for git chunk
omap <silent> ig <Plug>(coc-git-chunk-inner)
xmap <silent> ig <Plug>(coc-git-chunk-inner)
omap <silent> ag <Plug>(coc-git-chunk-outer)
xmap <silent> ag <Plug>(coc-git-chunk-outer)

" Navigate git chunks of current buffer
nmap <silent> ]g <Plug>(coc-git-nextchunk)
nmap <silent> [g <Plug>(coc-git-prevchunk)

" Navigate git conflicts of current buffer
nmap <silent> ]c <Plug>(coc-git-nextconflict)
nmap <silent> [c <Plug>(coc-git-prevconflict)

nmap <silent> <Space>a :CocCommand git.chunkStage<CR>
nmap <silent> <Space>u :CocCommand git.chunkUndo<CR>
nmap <silent> <Space>p :CocCommand git.chunkInfo<CR>

" Rename
nmap <silent> cr <Plug>(coc-rename)

" Apply codeAction, need lsp to support
xmap <silent> <CR> <Plug>(coc-codeaction-selected)

" Code navigation
let g:coc_enable_locationlist = 0

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)

autocmd User CocLocationsChange CocList --auto-preview location

" Diagnostic jump
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <silent> [d <Plug>(coc-diagnostic-prev)

" Jump previewd chunk
nmap <silent> <C-o> <Plug>(coc-float-jump)

"Preview windows move
imap <silent><expr> <C-j> coc#float#scroll(1)
imap <silent><expr> <C-k> coc#float#scroll(0)

" Coclist
nmap <silent> <Space>c :CocCommand<CR>
nmap <silent> <Space>l :CocList<CR>

" CocCommand
nmap <silent> <Space>d :CocList diagnostics<CR>
nmap <silent> <Space>f :CocList files<CR>
nmap <silent> <Space>w :CocList words<CR>
nmap <silent> <Space>g :CocList grep<CR>
nmap <silent> <Space>m :CocList mru -A<CR>
nmap <silent> <Space>b :CocList buffers<CR>

" Multi cursors
nmap <silent><expr> <C-s> <SID>select_current_word()
nmap <silent> <C-q> <Plug>(coc-cursors-word)

function! s:select_current_word()
  if !get(b:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunction

" Show documentation
nnoremap <silent> gh :call <SID>show_documentation()<CR>

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
      \: "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"

" Format and Import
nmap <silent> <Leader>f :call CocActionAsync('format')<CR>
nmap <silent> <Leader>i :call CocActionAsync('runCommand', 'editor.action.organizeImport')<CR>

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
Plug 'lambdalisue/suda.vim', {'on': ['SudaWrite', 'SudaRead']}

" Tag
Plug 'liuchengxu/vista.vim', {'on': 'Vista'}
let g:vista#renderer#enable_icon = 0

nnoremap <silent> <Space>v :Vista!!<CR>

" Float terminal
Plug 'voldikss/vim-floaterm', {'on': 'FloatermNew'}
let g:floaterm_opener = "tabe"
let g:floaterm_title = ""
let g:floaterm_width = 0.77
let g:floaterm_height = 0.90

nmap <silent> <C-g><CR> :FloatermNew zsh<CR>
nmap <silent> <C-g>p :FloatermToggle<CR>
tmap <silent> <C-g>p <CMD>FloatermToggle<CR>
nmap <silent> <C-g>l :FloatermNew lazygit<CR>
nmap <silent> <C-g>r :FloatermNew ranger<CR>
nmap <silent> <C-g>n :FloatermNew neomutt<CR>
nmap <silent> <C-g>h :FloatermNew htop<CR>

" Markdown
Plug 'mzlogin/vim-markdown-toc', {'for': 'markdown'}
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install',
      \ 'for': 'markdown'
      \ }
let g:mkdp_theme = 'light'
let g:vmt_list_item_char = '-'
let g:vmt_auto_update_on_save = 0

" Debug
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'leoluz/nvim-dap-go', {'for': 'go'}
nmap <silent> <Leader>db :DapToggleBreakpoint<CR>
nmap <silent> <Leader>dc :DapContinue<CR>

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
call plug#end()
