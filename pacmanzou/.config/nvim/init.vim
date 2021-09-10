" Author: pacmanzou <zoumanjaro@gmail.com> && <pacmanzou@qq.com>
" Github: https://github.com/pacmanzou
" Description: Nvim config


" Let:
let &t_ut                               = ''
let &termencoding                       = &encoding
let mapleader                           = ","
let g:netrw_nogx                        = 1
let g:python_host_prog                  = '/usr/bin/python2'
let g:python3_host_prog                 = '/usr/bin/python3'
let g:clipboard                         = {
            \ 'name': 'xsel_override',
            \ 'copy': {
            \ '+': 'xsel --input --clipboard',
            \ '*': 'xsel --input --primary',
            \ },
            \ 'paste': {
            \ '+': 'xsel --output --clipboard',
            \ '*': 'xsel --output --primary',
            \ },
            \ 'cache_enabled': 0,
            \ }


" Set:
set autochdir
set autoindent
set autoread
set clipboard=unnamedplus
set completeopt=longest,noinsert,menuone,noselect,preview
set expandtab
set fdm=indent
set fileencodings=utf-8,gbk,ucs-bom,cp936
set fillchars=stlnc:-
set foldcolumn=0
set foldenable
set foldlevel=99
set guioptions-=e
set hidden
set history=10000
set ignorecase
set inccommand=split
set incsearch
set laststatus=2
set lazyredraw
set list
set listchars=tab:\|\ ,trail:▫
set magic
set matchtime=0
set matchpairs+=<:>
set matchpairs+=《:》
set matchpairs+=（:）
set matchpairs+=【:】
set matchpairs+=“:”
set matchpairs+=‘:’
set noshowmatch
set noshowmode
set nospell
set nu
set relativenumber
set notimeout
set novisualbell
set nowritebackup
set ruler
set scrolloff=3
set shiftwidth=4
set shortmess+=c
set showtabline=2
set signcolumn=yes
set smartcase
set smartindent
set smarttab
set softtabstop=4
set splitbelow
set splitright
set syntax=off
set tabstop=4
set terse
set ttimeoutlen=0
set tw=0
set updatetime=100
set wildmenu
set wrap
set wrapscan


" Map:
" windows focus
noremap <silent><C-l> <C-w>l
noremap <silent><C-h> <C-w>h
noremap <silent><C-j> <C-w>j
noremap <silent><C-k> <C-w>k

" windows size
nnoremap zk <cmd>res +5<Cr>
nnoremap zj <cmd>res -5<Cr>
nnoremap zl <cmd>vertical resize-5<Cr>
nnoremap zh <cmd>vertical resize+5<Cr>

" windows exchange
nnoremap <silent><C-s> <C-w>K
nnoremap <silent><C-v> <C-w>H
nnoremap <silent><C-t> <C-w>T

" cursor move
noremap <C-e> $
noremap <C-a> ^
noremap <C-n> <C-i>
noremap <C-p> <C-o>
noremap J 5<C-e>
noremap K 5<C-y>

" tab switch
nnoremap <Tab> <cmd>tabnext<Cr>
nnoremap <S-Tab> <cmd>tabprevious<Cr>

" visual
noremap <silent>vv <C-v>
noremap <silent>gV ggvG$

" copy
nnoremap yn <cmd>let @+=expand('%')<Cr>
nnoremap yp <cmd>let @+=expand('%:p')<Cr>
nnoremap yd <cmd>let @+=getcwd()<Cr>

" imap
imap <C-h> <Backspace>
imap <C-d> <Delete>
imap <C-k> <Esc>lC
imap <C-a> <Esc>I
imap <C-e> <End>
imap <C-s> <Esc>lce
imap <C-o> <Esc>o
imap <C-f> <Right>
imap <C-b> <Left>
imap <C-q> <nop>
imap <C-v> <nop>
imap <C-z> <nop>
imap <C-g> <nop>
imap <C-l> <nop>
imap <C-Space> <nop>

" cmd
cmap <C-d> <Delete>
cmap <C-f> <Right>
cmap <C-b> <Left>
cmap <C-a> <Home>
cmap <C-e> <End>
cmap <C-t> <nop>
cmap <C-l> <nop>
cmap <C-k> <nop>
cmap <C-s> <nop>
cmap <C-z> <nop>
cmap <C-x> <nop>
cmap <C-v> <nop>
cmap <C-y> <nop>
cmap <C-o> <nop>
cmap <C-r> <nop>
cmap <C-q> <nop>
cmap <C-g> <nop>

" nop
map X <nop>
map S <nop>
map <C-z> <nop>
map <Space> <nop>

vmap <C-f> <nop>
vmap <C-b> <nop>

tnoremap <C-g> <nop>

" misc
noremap + <C-a>
noremap - <C-x>

vnoremap <C-o> <Esc>o
vnoremap g+ g<C-a>
vnoremap g- g<C-x>

nnoremap <C-q> <cmd>wq<Cr>
nnoremap Q @q
nnoremap / mr/\v
nnoremap Y y$
nnoremap > >>
nnoremap < <<


" Plugin:
filetype plugin on
filetype on
filetype indent on
filetype plugin indent on

let g:plug_window = '-tabnew'

call plug#begin('~/.config/nvim/plugged')

" colorscheme && statusline
Plug 'pacmanzou/gruvbox8.vim'
Plug 'rbong/vim-crystalline'
Plug 'luochen1990/rainbow'
Plug 'yggdroot/indentline'
Plug 'RRethy/vim-hexokinase',        { 'do': 'make hexokinase'}

" better operation
Plug 'pacmanzou/surround.vim'
Plug 'pacmanzou/capslock.vim'
Plug 'kana/vim-smartchr'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'brooth/far.vim'
Plug 'sbdchd/neoformat'
Plug 'alvan/vim-closetag'
Plug 'tommcdo/vim-exchange'
Plug 'mg979/vim-visual-multi'
Plug 'lpinilla/vim-codepainter'
Plug 'jiangmiao/auto-pairs'

" file manager
Plug 'kevinhwang91/rnvimr'

" tags manager
Plug 'liuchengxu/vista.vim'

" database manager
Plug 'tpope/vim-dadbod',                     { 'on': 'DBUI'}
Plug 'kristijanhusak/vim-dadbod-ui',         { 'on': 'DBUI'}
Plug 'kristijanhusak/vim-dadbod-completion', { 'on': 'DBUI'}

" floaterm
Plug 'voldikss/vim-floaterm'

" run code
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'

" completion engine
Plug 'neoclide/coc.nvim',            { 'branch': 'release'}

" debug engine
" Plug 'puremourning/vimspector'

" languages
" go
Plug 'josa42/vim-go-syntax',          { 'for': ['go', 'vim-plug']}

" javascript
Plug 'pangloss/vim-javascript',      { 'for': ['javascript', 'vim-plug']}

" markdown
Plug 'plasticboy/vim-markdown',      { 'for': ['markdown', 'vim-plug']}
Plug 'iamcco/markdown-preview.nvim',     {
            \ 'do': ':call mkdp#util#install()',
            \ 'for': ['markdown', 'vim-plug'],
            \ 'on':'MarkdownPreview'
            \ }

call plug#end()


" ColorschemeAndStatusline:
" Gruvbox8:
colorscheme gruvbox8

set termguicolors
set background=dark

let g:gruvbox_italics            = 1
let g:gruvbox_italicize_strings  = 1
let g:gruvbox_filetype_hi_groups = 0
let g:gruvbox_plugin_hi_groups   = 0

" my highlight
hi!   link           SignColumn      LineNr
hi    WarningMsg     guifg=#FE8019   guibg=#000000
hi    ErrorMsg       gui=bold        guifg=#ff4934   guibg=#000000
hi    Error          gui=bold        guifg=#fb4934   guibg=#000000
hi    CocErrorSign   guifg=#ff4934   guibg=#202124
hi    FloatermBorder guifg=#ebdbb2   guibg=#00000000
hi    IncSearch      gui=bold        guifg=#ebdbb2   guibg=#353535
hi    StatusLine     gui=reverse     guifg=#000000   guibg=#ebdbb2
hi    StatusLineNC   gui=reverse     guifg=#000000   guibg=#ebdbb2
hi    Search         gui=bold        guifg=#ebdbb2   guibg=#353535
hi    Pmenu          guifg=#ebdbb2   guibg=#202124
hi    CursorLine     guibg=#353535   guifg=#ebdbb2
hi    PmenuSel       gui=reverse     guibg=#ebdbb2   guifg=#353535
hi    PmenuThumb     guibg=#353535
hi    PmenuSbar      guibg=#202124
hi    DiffAdd        guifg=#b8bb26   guibg=#000000
hi    DiffChange     guifg=#8ec07c   guibg=#000000
hi    DiffDelete     guifg=#fb4934   guibg=#000000
hi    DiffText       guifg=#fabd2f   guibg=#000000
hi    Folded         gui=italic      guifg=#ebdbb2   guibg=#353535
hi    FoldColumn     guifg=#ebdbb2   guibg=#000000
hi    SpellBad       gui=undercurl   guifg=#fb4934   guisp=#fb4934
hi    SpellCap       gui=undercurl   guifg=#83a598   guisp=#83a598
hi    SpellRare      gui=undercurl   guifg=#d3869b   guisp=#d3869b
hi    SpellLocal     gui=undercurl   guifg=#8ec07c   guisp=#8ec07c


" Crystalline:
" coc
function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    let msgs = []
    if get(info, 'error', 0)
        call add(msgs, 'e' . info['error'])
    endif
    if get(info, 'warning', 0)
        call add(msgs, 'w' . info['warning'])
    endif
    return join(msgs)
endfunction

function! GitstatusG() abort
    let status = get(g:, 'coc_git_status', '')
    return  status
endfunction

function! GitstatusB() abort
    let status = get(b:, 'coc_git_status', '')
    return  status
endfunction

function! CurrentFunction() abort
    let status = get(b:, 'coc_current_function', '')
    return  status
endfunction

" statusline
function! StatusLine(current, width)
    let l:s = ''
    if a:current
        let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
    else
        let l:s .= '%#CrystallineInactive#'
    endif
    let l:s .= '%{CapsLockStatusline()}%{&spell?"SPELL ":""}%{&hlsearch?"HLSEARCH ":""} [%{CurrentFunction()}]%h%w%m%r'
    if a:current
        let l:s .= crystalline#right_sep('', 'Fill') . '  %l,%c,%L  %{StatusDiagnostic()}'
    endif
    let l:s .= '%='
    if a:current
        let l:s .= crystalline#left_sep('', 'Fill')
        let l:s .= crystalline#left_mode_sep('')
    endif
    if a:width > 40
        let l:s .= '%{GitstatusB()} %{GitstatusG()}  [%{&ft}|%{&fenc!=#""?&fenc:&enc}|%{&ff}] '
    else
        let l:s .= ''
    endif
    return l:s
endfunction

let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_theme         = 'pacmanzou'

set tabline=%!crystalline#bufferline(0,0,1)


" Rainbow:
let g:rainbow_active             = 1
let g:rainbow_conf               = {'guifgs': ['darkorange', 'darkgray']}


" Indentline:
let g:indentLine_char_list       = ['|']
let g:indentLine_fileTypeExclude = ['json']
let g:indentLine_bufTypeExclude  = ['help', 'terminal', 'nofile']


" Hexokinase:
let g:Hexokinase_highlighters = ['background']


" BetterOperation:
" SmartChr:
augroup All SmartChr
    autocmd!
    autocmd FileType * inoremap <buffer><expr> !
                \ smartchr#loop('!', '!=')
augroup END

augroup Golang SmartChr
    autocmd!
    autocmd FileType go inoremap <buffer><expr> ;
                \ smartchr#loop(';', ':=')
    autocmd FileType go inoremap <buffer><expr> .
                \ smartchr#loop('.', '...')
    autocmd FileType go inoremap <buffer><expr> ,
                \ smartchr#loop(',', '<-')
    autocmd FileType go inoremap <buffer><expr> ]]
                \ smartchr#loop('[][]')
augroup END

augroup Python SmartChr
    autocmd!
    autocmd FileType python inoremap <buffer><expr> .
                \ smartchr#loop('.', '->')
augroup END

augroup Sh SmartChr
    autocmd!
    autocmd FileType sh inoremap <buffer><expr> $
                \ smartchr#loop('$', '"${}"<Left><Left>')
augroup END


" Substitute:
" far
nnoremap <Space>s :Far<Space>
vnoremap <Space>s :Far<Space>


" VisualMulti:
let g:VM_leader             = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_silent_exit        = 1
let g:VM_show_warnings      = 0
let g:VM_maps               = {}
let g:VM_maps['Find Next']  = 'n'
let g:VM_maps['Find Prev']  = 'N'
let g:VM_maps['Find Under'] = ''
let g:VM_custom_motions     = {'<C-e>': '$', '<C-a>': '^'}
let g:VM_Cursor_hl          = 'Visual'
let g:VM_Mono_hl            = 'IncSearch'
let g:VM_Extend_hl          = 'IncSearch'
let g:VM_Insert_hl          = 'IncSearch'

nmap <Space>v <Plug>(VM-Find-Under)

xmap <Space>v <Plug>(VM-Find-Subword-Under)


" CloseTag:
let g:closetag_filenames = '*.html,*.xml,*.tmpl'


" Codepainter:
vnoremap <silent>p :<C-u>call codepainter#paintText(visualmode())<Cr>

nnoremap <Space>e <cmd>PainterEraseLine<Cr>
nnoremap <Space>E <cmd>PainterEraseAll<Cr>


" Neoformat:
let g:neoformat_enabled_go = ['gofmt']
let g:neoformat_enabled_python = ['black']
let g:neoformat_enabled_sh = ['shfmt']
let g:neoformat_enabled_json = ['jsbeautify']
let g:neoformat_enabled_sql = ['pg_format']
let g:neoformat_enabled_javascript = ['jsbeautify']
let g:neoformat_enabled_html = ['htmlbeautify']
let g:neoformat_enabled_css = ['cssbeautify']
let g:neoformat_enabled_markdown = ['prettier']
let g:neoformat_enabled_c = ['astyle']
let g:neoformat_enabled_cpp = ['astyle']

" when a filetype is not found
let g:neoformat_basic_format_align = 0
let g:neoformat_basic_format_retab = 0

" del $ space
let g:neoformat_basic_format_trim = 0

" saved silent autoformat
autocmd BufWritePre *.go,*.python,*.sh,
            \*.js,*.html,*.css,*.markdown,*.c,*.cpp silent Neoformat


" Exchange:
nmap <silent>cx <Plug>(Exchange)
nmap <silent>cxc <Plug>(ExchangeClear)

vmap <silent>x <Plug>(Exchange)


" FileManager:
" Rnvimr:
let g:rnvimr_presets               = [{'width': 0.99, 'height': 0.93}]
let g:rnvimr_enable_ex             = 1
let g:rnvimr_enable_bw             = 1
let g:rnvimr_draw_border           = 1
let g:rnvimr_border_attr           = {'fg': -1, 'bg': -1}
let g:rnvimr_vanilla               = 0
let g:rnvimr_action                = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-s>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'ew': 'EmitRangerCwd'
            \ }

tnoremap <C-g>r <C-\><C-n><cmd>RnvimrToggle<Cr>

nnoremap <C-g>r <cmd>RnvimrToggle<Cr>


" TagsManager:
" Vista:
let g:vista_sidebar_position     = 'vertical botright'
let g:vista_sidebar_width        = 35
let g:vista_icon_indent          = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 0
let g:vista_default_executive    = 'ctags'

nnoremap T <cmd>Vista!!<Cr>
nnoremap <Space>T <cmd>Vista finder<Cr>

autocmd FileType vista,vista_kind nnoremap <buffer><silent>/ :<C-u>call vista#finder#fzf#Run()<Cr>


" Undo Backup Swap:
set nobackup
set swapfile
set dir=~/.cache/vim/swap/

if empty(glob('~/.cache/vim/swap'))
    silent !mkdir -p ~/.cache/vim/swap
endif

if empty(glob('~/.cache/vim/undo'))
    silent !mkdir -p ~/.cache/vim/undo/
endif

if has('persistent_undo')
    set undofile
    set undodir=~/.cache/vim/undo/
endif


" Dadbod:
let g:db_ui_save_location  = '~/.config/nvim/connections.json'
let g:db_ui_winwidth = 35


" Floaterm:
let g:neoterm_autoscroll   = 1
let g:floaterm_borderchars = ['─', '│', '─', '│', '┌', '┐', '┘', '└']
let g:floaterm_width       = 0.99
let g:floaterm_height      = 0.99
let g:floaterm_position    = "top"

tnoremap <C-o> <C-\><C-n>
tnoremap <C-g><Return> <cmd>FloatermToggle<Cr>

nnoremap <C-g><Return> <cmd>FloatermToggle<Cr>

autocmd TermOpen term://* startinsert


" AsyncrunAndAsyncTask:
" tab run
let g:asyncrun_status       = ''
let g:asyncrun_open         = 9
let g:asynctasks_term_pos   = 'TAB'
let g:asynctasks_term_reuse = 1
let g:asyncrun_rootmarks    = [
            \ '.git',
            \ '.svn',
            \ '.root',
            \ '.project',
            \ '.hg',
            \ '.idea',
            \ '.gitignore',
            \ 'Makefile',
            \ 'CMakeLists.txt',
            \ '*.pro',
            \ '.tasks'
            \ ]

nnoremap <Space>r <cmd>AsyncTask run<Cr>
nnoremap <Space>a :AsyncTask<space>


" Coc:
let g:coc_global_extensions = [
            \ 'coc-go',
            \ 'coc-clangd',
            \ 'coc-pyright',
            \ 'coc-json',
            \ 'coc-sh',
            \ 'coc-sqlfluff',
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
            \ 'coc-lists',
            \ 'coc-git',
            \ 'coc-explorer',
            \ 'coc-yank',
            \ 'coc-translator',
            \ 'coc-leetcode'
            \ ]

" show documentation
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
        nnoremap <buffer> q <cmd>q<Cr>
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

nnoremap gh <cmd>call <sid>show_documentation()<Cr>

" coc-snippets
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'

imap <C-j> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)

" file explorer
nmap t <cmd>CocCommand explorer --sources=file+<Cr>

" variable rename
nmap cr <Plug>(coc-rename)

" refresh in insert mode or normal mode
nnoremap <Space><C-r> <cmd>CocRestart<Cr>
inoremap <silent><expr><C-r> coc#refresh()

" refactor function
nmap <silent>cR <Plug>(coc-refactor)

" float window jump
nmap <silent><C-o> <Plug>(coc-float-jump)

" apply codeAction
xmap <silent><Space>a <Plug>(coc-codeaction-selected)

" go to code navigation
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>gt <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)

" diagnostic jump
nmap <silent>]d <Plug>(coc-diagnostic-next)
nmap <silent>[d <Plug>(coc-diagnostic-prev)

" git chunk jump
nmap <silent><leader>j <Plug>(coc-git-nextchunk)
nmap <silent><leader>k <Plug>(coc-git-prevchunk)

" translate
nmap <silent><Space>t <Plug>(coc-translator-e)

vmap <silent><Space>t <Plug>(coc-translator-ev)

" float window scroll
nnoremap <nowait><expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "<cmd>Neoformat<Cr>"
nnoremap <nowait><expr><C-b> coc#float#scroll(0)

" function and class
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)

omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
omap ic <Plug>(coc-classobj-i)
omap ac <Plug>(coc-classobj-a)

" coclist and coccommand
nnoremap <Space>l <cmd>CocList<Cr>
nnoremap <Space>d <cmd>CocList diagnostics<Cr>
nnoremap <Space>y <cmd>CocList yank<Cr>
nnoremap <Space>f <cmd>CocList --regex files<Cr>
nnoremap <Space>b <cmd>CocList buffers<Cr>
nnoremap <Space>w <cmd>CocList words<Cr>
nnoremap <Space>g <cmd>CocList grep<Cr>
nnoremap <Space>m <cmd>CocList marks<Cr>
nnoremap <Space>h <cmd>CocList --regex mru -A<Cr>

nnoremap <Space>c <cmd>CocCommand<Cr>
nnoremap <C-y> <cmd>CocCommand editor.action.organizeImport<Cr>

nnoremap <leader>a <cmd>CocCommand git.chunkStage<Cr>
nnoremap <leader>u <cmd>CocCommand git.chunkUndo<Cr>
nnoremap <leader>p <cmd>CocCommand git.chunkInfo<Cr>
nnoremap <leader>y <cmd>CocCommand git.copyUrl<Cr>
nnoremap <leader>s <cmd>CocCommand git.showCommit<Cr>
nnoremap <leader>f <cmd>CocCommand git.foldUnchanged<Cr>
nnoremap <leader>b <cmd>CocCommand git.browserOpen<Cr>

" organizeImport
autocmd BufWritePre *.go silent call CocAction('runCommand', 'editor.action.organizeImport')

" highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" update signature help on jump placeholder
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')


" Languages:
" Go:
let g:go_highlight_array_whitespace_error    = 1
let g:go_highlight_build_constraints         = 1
let g:go_highlight_chan_whitespace_error     = 1
let g:go_highlight_extra_types               = 1
let g:go_highlight_fields                    = 1
let g:go_highlight_format_strings            = 1
let g:go_highlight_function_calls            = 1
let g:go_highlight_function_parameters       = 1
let g:go_highlight_functions                 = 1
let g:go_highlight_generate_tags             = 1
let g:go_highlight_methods                   = 1
let g:go_highlight_operators                 = 1
let g:go_highlight_space_tab_error           = 1
let g:go_highlight_string_spellcheck         = 1
let g:go_highlight_structs                   = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types                     = 1
let g:go_highlight_variable_declarations     = 1
let g:go_highlight_variable_assignments      = 0


" Javascript:
let g:javascript_plugin_jsdoc                = 1
let g:javascript_plugin_ngdoc                = 1
let g:javascript_plugin_flow                 = 1


" Markdown:
" vim-markdown
let g:vim_markdown_folding_disabled          = 1
let g:vim_markdown_conceal                   = 0
let g:vim_markdown_conceal_code_blocks       = 0
let g:vim_markdown_math                      = 0

" markdown-preview
let g:mkdp_browser                           = 'chromium'
let g:mkdp_auto_start                        = 0
let g:mkdp_auto_close                        = 0
let g:mkdp_refresh_slow                      = 0
let g:mkdp_command_for_global                = 0
let g:mkdp_open_to_the_world                 = 0
let g:mkdp_open_ip                           = ''
let g:mkdp_echo_preview_url                  = 0
let g:mkdp_browserfunc                       = ''
let g:mkdp_preview_options                   = {
            \ 'mkit': {},
            \ 'katex': {},
            \ 'uml': {},
            \ 'maid': {},
            \ 'disable_sync_scroll': 0,
            \ 'sync_scroll_type': 'middle',
            \ 'hide_yaml_meta': 1,
            \ 'sequence_diagrams': {},
            \ 'flowchart_diagrams': {},
            \ 'content_editable': v:false,
            \ 'disable_filename': 0
            \ }
let g:mkdp_markdown_css                      = ''
let g:mkdp_highlight_css                     = ''
let g:mkdp_port                              = ''
let g:mkdp_page_title                        = '${name}'


" MarkdownSpell:
autocmd BufReadPre,BufNewFile *.md setlocal spell spelllang=en_us,cjk

nnoremap <C-g>s <cmd>set spell!<Cr>


" Misc:
" Smooth_scroll:
" scroll the screen up
function! init#up(dist, duration, speed)
    call s:init('u', a:dist, a:duration, a:speed)
endfunction

" scroll the screen down
function! init#down(dist, duration, speed)
    call s:init('d', a:dist, a:duration, a:speed)
endfunction

" animation
function! s:init(dir, dist, duration, speed)
    for i in range(a:dist/a:speed)
        let start = reltime()
        if a:dir ==# 'd'
            exec "normal! ".a:speed."\<C-e>".a:speed."j"
        else
            exec "normal! ".a:speed."\<C-y>".a:speed."k"
        endif
        redraw
        let elapsed = s:get_ms_since(start)
        let snooze = float2nr(a:duration-elapsed)
        if snooze > 0
            exec "sleep ".snooze."m"
        endif
    endfor
endfunction

function! s:get_ms_since(time)
    let cost = split(reltimestr(reltime(a:time)), '\.')
    return str2nr(cost[0])*1000 + str2nr(cost[1])/1000.0
endfunction

nnoremap <silent><C-u> :call init#up(&scroll,6,1)<Cr>
nnoremap <silent><C-d> :call init#down(&scroll,6,1)<Cr>


" Comment:
augroup Comment for different filetype
    autocmd!
    autocmd FileType python,sh set commentstring=#\ %s
    autocmd FileType c,cpp set commentstring=//\ %s
    autocmd FileType markdown,md setlocal commentstring=<!--\ %s-->
    autocmd FileType sql setlocal commentstring=--\ %s
augroup END


" Hlsearch:
autocmd BufReadPre * set nohlsearch

nnoremap <nowait><expr><C-g>h &hlsearch ? "<cmd>set nohlsearch<Cr>" : "<cmd>set hlsearch<Cr>"


" SaveCursor:
au BufReadPost * if line("'\"")>1 && line("'\"") <= line("$") && &filetype != 'gitcommit' | exe "normal! g'\"" | endif


" Hugefile:
" file maxsize
let g:trigger_size         = 0.5 * 1024 * 1024

" coc startup delay
let g:coc_start_at_startup = 0

" cocstart
function! CocTimerStart(timer)
    exec "CocStart"
endfunction

autocmd VimEnter *
            \ let size = getfsize(expand('<afile>')) |
            \ if (size > g:trigger_size) || (size == -2) |
            \   echohl WarningMsg |
            \ echomsg 'WARNING: Coc is dead for this huge file!' |
            \ echohl None |
            \ else |
            \   call timer_start(100,'CocTimerStart',{'repeat':1}) |
            \ endif |
            \ unlet size


" Super_L:
augroup Super_L
    autocmd!
    autocmd FileType go inoremap <buffer><C-l> fmt.Println()<Left>
    autocmd FileType python inoremap <buffer><C-l> print()<Left>
    autocmd FileType sh inoremap <buffer><C-l> echo ""<Left>
augroup END


" Visual_IA:
function! Force_blockwise(next_key)
  return s:setup_keyseq_table[a:next_key][mode()]
endfunction

let s:setup_keyseq_table = {
\   'I': {'v': "\<C-v>I", 'V': "\<C-v>^o^I", "\<C-v>": 'I'},
\   'A': {'v': "\<C-v>A", 'V': "\<C-v>0o$A", "\<C-v>": 'A'},
\ }

vnoremap <expr> <Plug>(niceblock-I)  Force_blockwise('I')
vnoremap <expr> <Plug>(niceblock-A)  Force_blockwise('A')

if !exists('g:niceblock_no_default_key_mappings') ||
\  !g:niceblock_no_default_key_mappings
  silent! xmap <unique> I  <Plug>(niceblock-I)
  silent! xmap <unique> A  <Plug>(niceblock-A)
endif


" Rename:
command! -nargs=1 Rename
            \ let tpname = expand('%:t') |
            \ saveas <args> |
            \ edit <args> |
            \ call delete(expand(tpname))


" Cleanbuffers:
command! -nargs=? -complete=buffer -bang BufClean
    \ :call BufClean('<bang>')

function! BufClean(bang)
	let last_buf = bufnr('$')

	let del_cnt = 0
	let bufn = 1

	while bufn <= last_buf
		if buflisted(bufn) && bufwinnr(bufn) == -1
			if a:bang == '' && getbufvar(bufn, '&modified')
				echohl ErrorMsg
				echohl 'No write since last change for buffer(add ! to override)'
				echohl None
			else
				silent exe 'bdel' . a:bang . ' ' . bufn
				if ! buflisted(bufn)
					let del_cnt = del_cnt + 1
				endif
			endif
		endif
		let bufn = bufn + 1
	endwhile

	if del_cnt > 0
		echomsg 'clean done, ' del_cnt 'buffer(s) deleted'
	endif
endfunction
