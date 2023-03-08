" Plugins
let g:nvim_plugins_installation_completed = 1

" Check whether installed automatically
if empty(glob('$HOME/.config/nvim/plugged/coc.nvim'))
  let g:nvim_plugins_installation_completed = 0

	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim-plug
call plug#begin('$HOME/.config/nvim/plugged')

" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
      \ 'coc-pyright',
      \ 'coc-sql',
      \ 'coc-json',
      \ 'coc-yaml',
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
inoremap <silent><expr> <c-l> coc#pum#confirm()

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
xmap <silent> <c-l> <plug>(coc-codeaction-selected)

" Go to code navigation
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

inoremap <silent><expr> <c-j> coc#float#scroll(1)
inoremap <silent><expr> <c-k> coc#float#scroll(0)

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
command! -nargs=0 OR :call CocActionAsync('runCommand',
      \ 'editor.action.organizeImport')

" Misc auto commands
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')

" To Avoid an error when not installed
if g:nvim_plugins_installation_completed == 1
  autocmd CursorHold * silent call CocActionAsync('highlight')
endif

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
      \ 'gomod',
      \ 'css',
      \ 'markdown',
      \ 'coc-explorer',
      \ 'vista'
      \ ]

" For vim-surround
Plug 'tpope/vim-repeat'

" Comment
Plug 'tomtom/tcomment_vim'

" Sudo
Plug 'lambdalisue/suda.vim'

" Make the text alignment quickily
Plug 'junegunn/vim-easy-align'
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" Float terminal
Plug 'voldikss/vim-floaterm'
let g:floaterm_width = 3.0
let g:floaterm_height = 3.0

nnoremap <silent> <c-g><cr> :FloatermNew zsh<cr>
nnoremap <silent> <c-g>p :FloatermToggle<cr>
tnoremap <silent> <c-g>p <cmd>FloatermToggle<cr>
nnoremap <silent> <c-g>l :FloatermNew lazygit<cr>
nnoremap <silent> <c-g>r :FloatermNew ranger<cr>
nnoremap <silent> <c-g>n :FloatermNew neomutt<cr>
nnoremap <silent> <c-g>h :FloatermNew htop<cr>

" Tag
Plug 'liuchengxu/vista.vim'
nnoremap <silent> <space>v :Vista!!<cr>

" Go
Plug 'buoto/gotests-vim', {'for': 'go'}
Plug 'fatih/vim-go', {'for': ['go', 'gomod']}
let g:go_term_mode = "split"
let g:go_fold_enable = []
let g:go_term_height = 10
let g:go_list_height = 10
let g:go_term_enabled = 1
let g:go_term_close_on_exit = 1
let g:go_term_reuse = 1
let g:go_gopls_gofumpt = 1
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 0
let g:go_imports_autosave = 0
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_code_completion_enabled = 0
let g:go_template_autocreate = 0
let g:go_debug_breakpoint_sign_text = ''

" Markdown
" Preivew
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install',
      \ 'for': 'markdown'
      \ }
let g:mkdp_theme = 'light'

" Toc
Plug 'mzlogin/vim-markdown-toc', {'for': 'markdown'}
let g:vmt_list_item_char = "-"

" Javascript
Plug 'pangloss/vim-javascript', {'for': 'javascript'}

" Html
Plug 'othree/html5.vim', {'for': 'html'}

" Vue
Plug 'posva/vim-vue', {'for': 'vue'}

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'RRethy/nvim-treesitter-textsubjects'

call plug#end()

if g:nvim_plugins_installation_completed == 1
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "go",
    "gomod",
    "python",
    "bash"
    },
  highlight = {
    enable = true,
  },
  textsubjects = {
    enable = true,
    keymaps = {
      ['.'] = 'textsubjects-smart'
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner"
      },
    },
  },
}
EOF
endif
