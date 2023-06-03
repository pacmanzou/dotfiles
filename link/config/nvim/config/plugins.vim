" Plugins
" Installed mark
let g:nvim_plugins_installation_completed = 1

" Check whether installed automatically
if empty(glob('$HOME/.config/nvim/plugged/coc.nvim'))
  " Non-installed mark
  let g:nvim_plugins_installation_completed = 0
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim-plug
let g:plug_window = 'vsplit new'
call plug#begin('$HOME/.config/nvim/plugged')
" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
      \ 'coc-clangd',
      \ 'coc-pyright',
      \ 'coc-lua',
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
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <plug>(coc-funcobj-i)
omap if <plug>(coc-funcobj-i)
xmap af <plug>(coc-funcobj-a)
omap af <plug>(coc-funcobj-a)
xmap ic <plug>(coc-classobj-i)
omap ic <plug>(coc-classobj-i)
xmap ac <plug>(coc-classobj-a)
omap ac <plug>(coc-classobj-a)

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

nnoremap <silent> gh :call <SID>show_documentation()<cr>

" Multi cursors
function! s:select_current_word()
  if !get(b:, 'coc_cursors_activated', 0)
    return "\<plug>(coc-cursors-word)"
  endif
  return "*\<plug>(coc-cursors-word):nohlsearch\<cr>"
endfunction

nnoremap <silent><expr> <c-s> <SID>select_current_word()
nnoremap <silent> <c-q> <plug>(coc-cursors-word)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Auto commands
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')

" Go
autocmd BufWritePre *.go silent call CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufWritePre *.go silent call CocAction('runCommand', 'editor.action.formatDocument')

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

" Tag
Plug 'liuchengxu/vista.vim'
let g:vista#renderer#enable_icon = 0
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
Plug 'mzlogin/vim-markdown-toc', {'for': 'markdown'}
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install',
      \ 'for': 'markdown'
      \ }
let g:mkdp_theme = 'light'
let g:vmt_list_item_char = '-'
let g:vmt_auto_update_on_save = 0

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'RRethy/nvim-treesitter-textsubjects'
call plug#end()

" Load Lua config
if g:nvim_plugins_installation_completed == 1
lua << EOF
require'nvim-treesitter.configs'.setup {
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
              return true
          end
      end,
      additional_vim_regex_highlighting = false,
  },
  textsubjects = {
    enable = true,
    keymaps = {
      ['.'] = 'textsubjects-smart'
    },
  },
}
EOF
endif
