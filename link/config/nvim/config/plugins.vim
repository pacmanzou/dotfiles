" Set vim-plug tab
let g:plug_window = '-tabnew'

call plug#begin('$HOME/.config/nvim/plugged')
" Priority
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

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'RRethy/nvim-treesitter-textsubjects'

Plug 'fatih/vim-go',      {'for': ['go', 'gomod']}
Plug 'buoto/gotests-vim', {'for': 'go'}
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

Plug 'othree/html5.vim',        {'for': 'html'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'posva/vim-vue',           {'for': 'vue'}

" Primary
Plug 'tpope/vim-repeat',          {'on': []}
Plug 'tomtom/tcomment_vim',       {'on': []}
Plug 'junegunn/vim-easy-align',   {'on': []}
Plug 'voldikss/vim-floaterm',     {'on': []}
Plug 'liuchengxu/vista.vim',      {'on': []}
Plug 'neoclide/coc.nvim',         {'on': [], 'branch': 'release'}

" Markdown
Plug 'mzlogin/vim-markdown-toc',     {'on': []}
Plug 'iamcco/markdown-preview.nvim', {
      \ 'do': 'cd app && yarn install',
      \ 'on': []
      \ }
call plug#end()

function! s:SourceList(path) abort
  let l:sourceList = a:path

  for l:item in l:sourceList
    exec 'source '. l:item
  endfor
endfunction

function! LoadPrimaryPlugins(timer) abort
  " Load primary plugins
  call plug#load(
        \ 'vim-repeat',
        \ 'tcomment_vim',
        \ 'vim-easy-align',
        \ 'vim-floaterm',
        \ 'vista.vim',
        \ 'coc.nvim'
        \ )

  " Source primary plugins config
  call s:SourceList(split(glob('$HOME/.config/nvim/config/plugins/primary/*.vim')))
endfunction

function! LoadMarkdownPlugins(timer) abort
  " Load markdown plugins
  call plug#load(
        \ 'vim-markdown-toc',
        \ 'markdown-preview.nvim'
        \ )

  " Source markdown plugins config
  call s:SourceList(split(glob('$HOME/.config/nvim/config/plugins/markdown/*.vim')))
endfunction

" Load plugins config if plugins installation completed
if g:nvim_plugins_installation_completed == 1
  " Primary
  autocmd VimEnter * call timer_start(50, 'LoadPrimaryPlugins')

  " Markdown
  autocmd FileType markdown call timer_start(100, 'LoadMarkdownPlugins')

" Load lua settings
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
