" Author: Zou Jiancheng <pacmanzou@qq.com>
" Github: https://github.com/pacmanzou
" Description: Nvim config


" Let:
let &termencoding = &encoding
let mapleader = ","
let g:netrw_nogx = 1
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
let g:clipboard = {
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
set noshowcmd
set nospell
set nu
set notimeout
set novisualbell
set nowritebackup
set ruler
set scrolloff=3
set shiftwidth=4
set shortmess+=c
set showtabline=2
set signcolumn=number
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
" nop
map Z <nop>
map z<cr> <nop>
map z+ <nop>
map z- <nop>
map z. <nop>
map z= <nop>
map zA <nop>
map zC <nop>
map zD <nop>
map zE <nop>
map zF <nop>
map zG <nop>
map zH <nop>
map zL <nop>
map zM <nop>
map zN <nop>
map zO <nop>
map zR <nop>
map zW <nop>
map zX <nop>
map z^ <nop>
map za <nop>
map zb <nop>
map zc <nop>
map zd <nop>
map ze <nop>
map zf <nop>
map zg <nop>
map zh <nop>
map zi <nop>
map zj <nop>
map zk <nop>
map zl <nop>
map zm <nop>
map zn <nop>
map zo <nop>
map zp <nop>
map zP <nop>
map zr <nop>
map zs <nop>
map zt <nop>
map zv <nop>
map zw <nop>
map zx <nop>
map zy <nop>
map zu <nop>

map <c-w>+ <nop>
map <c-w>- <nop>
map <c-w>< <nop>
map <c-w>> <nop>
map <c-w>H <nop>
map <c-w>J <nop>
map <c-w>K <nop>
map <c-w>L <nop>
map <c-w>P <nop>
map <c-w>R <nop>
map <c-w>S <nop>
map <c-w>T <nop>
map <c-w>W <nop>
map <c-w>] <nop>
map <c-w>^ <nop>
map <c-w>_ <nop>
map <c-w>b <nop>
map <c-w>c <nop>
map <c-w>d <nop>
map <c-w>F <nop>
map <c-w>g <nop>
map <c-w>h <nop>
map <c-w>i <nop>
map <c-w>j <nop>
map <c-w>k <nop>
map <c-w>l <nop>
map <c-w>n <nop>
map <c-w>p <nop>
map <c-w>r <nop>
map <c-w>s <nop>
map <c-w>t <nop>
map <c-w>v <nop>
map <c-w>w <nop>
map <c-w>x <nop>
map <c-w>z <nop>
map <c-w>\| <nop>
map <c-w>} <nop>
map <c-w>q <nop>
map <c-w>o <nop>
map <c-w>f <nop>

map <c-q> <nop>
map <c-t> <nop>
map <c-s> <nop>
map <c-z> <nop>
map <c-v> <nop>
map <c-m> <nop>
map <space> <nop>

vmap q <nop>
vmap t <nop>
vmap o <nop>
vmap s <nop>
vmap n <nop>
vmap N <nop>
vmap <C-f> <nop>
vmap <C-b> <nop>

tmap <C-g> <nop>

" imap
imap <c-q> <nop>
imap <c-e> <end>
imap <c-r> <nop>
imap <c-o> <esc>o
imap <c-a> <esc>I
imap <c-s> <esc>lce
imap <c-d> <delete>
imap <c-f> <right>
imap <c-g> <nop>
imap <c-h> <backspace>
imap <c-j> <nop>
imap <c-k> <esc>lC
imap <c-l> <nop>
imap <c-z> <nop>
imap <c-v> <nop>
imap <c-b> <left>
imap <c-Space> <nop>

" cmd
cmap <c-q> <nop>
cmap <c-e> <end>
cmap <c-r> <nop>
cmap <c-t> <nop>
cmap <c-y> <nop>
cmap <c-o> <nop>
cmap <c-a> <home>
cmap <c-s> <nop>
cmap <c-d> <delete>
cmap <c-f> <right>
cmap <c-g> <nop>
cmap <c-j> <nop>
cmap <c-k> <nop>
cmap <c-l> <nop>
cmap <c-z> <nop>
cmap <c-x> <nop>
cmap <c-v> <nop>
cmap <c-b> <left>

" windows focus
noremap <silent><c-l> <c-w>l
noremap <silent><c-h> <c-w>h
noremap <silent><c-j> <c-w>j
noremap <silent><c-k> <c-w>k

" windows exchange
nnoremap <silent><c-w>t <c-w>T
nnoremap <silent><c-w>h <c-w>H
nnoremap <silent><c-w>j <c-w>J
nnoremap <silent><c-w>k <c-w>K
nnoremap <silent><C-w>l <c-w>L

" cursor move
noremap <silent><c-e> $
noremap <silent><c-a> ^
noremap <silent>J 5<c-e>
noremap <silent>K 5<c-y>

" tab switch
nnoremap <silent><c-n> <cmd>tabnext<cr>
nnoremap <silent><c-p> <cmd>tabprevious<cr>

" visual
noremap <silent>vv <c-v>
noremap <silent>gV ggvG$

" copy
nnoremap <silent>yn <cmd>let @+=expand('%')<cr>
nnoremap <silent>yp <cmd>let @+=expand('%:p')<cr>
nnoremap <silent>yd <cmd>let @+=getcwd()<cr>

" misc
noremap <silent>+ <c-a>
noremap <silent>- <c-x>

vnoremap <silent>+ g<c-a>
vnoremap <silent>- g<c-x>

nnoremap / mr/\v
nnoremap <silent>Y y$
nnoremap <silent>> >>
nnoremap <silent>< <<
nnoremap <silent>Q @q
nnoremap <silent><c-g>f <c-w>f


" Plugin:
filetype plugin on
filetype on
filetype indent on
filetype plugin indent on

let g:plug_window = '-tabnew'

call plug#begin('~/.config/nvim/plugged')

" colorscheme && statusline
Plug 'pacmanzou/gruvbox8.vim'
Plug 'pacmanzou/crystalline.vim'
Plug 'luochen1990/rainbow'
Plug 'RRethy/vim-illuminate'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase'}

" better operation
Plug 'pacmanzou/surround.vim'
Plug 'pacmanzou/exchange.vim'
Plug 'pacmanzou/capslock.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'gcmt/wildfire.vim'
Plug 'kana/vim-smartchr'
Plug 'sbdchd/neoformat'
Plug 'alvan/vim-closetag'
Plug 'mg979/vim-visual-multi'
Plug 'lpinilla/vim-codepainter'
Plug 'jiangmiao/auto-pairs'
Plug 'lambdalisue/suda.vim'

" file manager
Plug 'kevinhwang91/rnvimr'

" tags manager
Plug 'liuchengxu/vista.vim'

" database manager
Plug 'tpope/vim-dadbod', { 'on': 'DBUI'}
Plug 'kristijanhusak/vim-dadbod-ui', { 'on': 'DBUI'}
Plug 'kristijanhusak/vim-dadbod-completion', { 'on': 'DBUI'}

" floaterm
Plug 'voldikss/vim-floaterm'

" run code
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'

" completion engine
Plug 'neoclide/coc.nvim', { 'branch': 'release'}
Plug 'wellle/tmux-complete.vim'

" debug engine
" Plug 'puremourning/vimspector'

" languages
" go
Plug 'josa42/vim-go-syntax', { 'for': ['go', 'vim-plug']}

" javascript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'vim-plug']}

" markdown
Plug 'plasticboy/vim-markdown', { 'for': ['markdown', 'vim-plug']}
Plug 'mzlogin/vim-markdown-toc', { 'for': ['markdown', 'vim-plug'] }
Plug 'iamcco/markdown-preview.nvim', {
            \ 'do': 'cd app && yarn install',
            \ 'for': ['markdown', 'vim-plug'],
            \ 'on':'MarkdownPreview'
            \ }

call plug#end()


" ColorschemeAndStatusline:
" Gruvbox8:
colorscheme gruvbox8

set termguicolors
set background=dark

let g:gruvbox_italics = 1
let g:gruvbox_italicize_strings = 1
let g:gruvbox_filetype_hi_groups = 0
let g:gruvbox_plugin_hi_groups = 0

" my highlight
hi!   link           SignColumn      LineNr
hi    WarningMsg     guifg=#FE8019   guibg=#000000
hi    ErrorMsg       gui=bold        guifg=#ff4934   guibg=#000000
hi    Error          gui=bold        guifg=#fb4934   guibg=#000000
hi    CocErrorSign   guifg=#ff4934   guibg=#1d1d1d
hi    FloatermBorder guifg=#ebdbb2   guibg=#00000000
hi    IncSearch      gui=bold        guifg=#ffffff   guibg=#353535
hi    StatusLine     gui=reverse     guifg=#000000   guibg=#ebdbb2
hi    StatusLineNC   gui=reverse     guifg=#000000   guibg=#ebdbb2
hi    Search         gui=bold        guifg=#ffffff   guibg=#353535
hi    Pmenu          guifg=#ebdbb2   guibg=#1d1d1d
hi    CursorLine     guibg=#353535   guifg=#ebdbb2
hi    PmenuSel       gui=reverse     guibg=#ebdbb2   guifg=#353535
hi    PmenuThumb     guibg=#353535
hi    PmenuSbar      guibg=#1d1d1d
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
        let l:s .= crystalline#right_sep('', 'Fill') . ' %l %c %L '
    if a:current
        let l:s .= '%{CapsLockStatusline()}%{&spell?"SPELL ":""}%{&hlsearch?"HLSEARCH ":""} [%{CurrentFunction()}]%h%w%m%r  %{StatusDiagnostic()}'
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
let g:crystalline_theme = 'pacmanzou'

set tabline=%!crystalline#bufferline(0,0,1)


" Rainbow:
let g:rainbow_active = 1
let g:rainbow_conf = {'guifgs': ['darkorange', 'darkgray']}


" Indent_blankline:
let g:indent_blankline_char_list = ['|', '¦', '┆', '┊']
let g:indent_blankline_filetype_exclude = ['help']
let g:indent_blankline_buftype_exclude = ['terminal']

autocmd FileType go setlocal noexpandtab


" Hexokinase:
let g:Hexokinase_highlighters = ['background']


" Illuminate:
let g:Illuminate_highlightUnderCursor = 0
let g:Illuminate_delay = 700


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


" Wildfire:
let g:wildfire_objects = {
    \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip", "i>"],
    \ "html,xml" : ["at", "it"],
\ }

map <c-m> <plug>(wildfire-fuel)


" Abolish:
nnoremap <space>s :%S///g<left><left><left>
vnoremap <space>s :S//g<left><left>


" VisualMulti:
let g:VM_leader = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_silent_exit = 1
let g:VM_show_warnings = 0
let g:VM_maps = {}
let g:VM_maps['Find Next'] = 'n'
let g:VM_maps['Find Prev'] = 'N'
let g:VM_maps['Find Under'] = ''
let g:VM_custom_motions  = {'<C-e>': '$', '<C-a>': '^'}
let g:VM_Cursor_hl = 'Visual'
let g:VM_Mono_hl = 'IncSearch'
let g:VM_Extend_hl = 'IncSearch'
let g:VM_Insert_hl = 'IncSearch'

nmap <silent><space>v <plug>(VM-Find-Under)

vmap <silent><space>v <plug>(VM-Find-Subword-Under)


" CloseTag:
let g:closetag_filenames = '*.html,*.xml,*.tmpl'


" Codepainter:
vnoremap <silent>p :<c-u>call codepainter#paintText(visualmode())<cr>

nnoremap <silent><space>e <cmd>PainterEraseLine<cr>
nnoremap <silent><space>E <cmd>PainterEraseAll<cr>


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

nnoremap <silent><c-g>n <cmd>Neoformat<cr>


" Exchange:
nmap <silent>cx <plug>(Exchange)
nmap <silent>cxc <plug>(ExchangeClear)

vmap <silent>x <plug>(Exchange)


" FileManager:
" Rnvimr:
let g:rnvimr_presets = [{'width': 0.99, 'height': 0.93}]
let g:rnvimr_enable_ex = 1
let g:rnvimr_enable_bw = 1
let g:rnvimr_draw_border = 1
let g:rnvimr_border_attr = {'fg': -1, 'bg': -1}
let g:rnvimr_vanilla = 0
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-s>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'ew': 'EmitRangerCwd'
            \ }

tnoremap <silent><c-g>r <c-\><c-n><cmd>RnvimrToggle<cr>

nnoremap <silent><c-g>r <cmd>RnvimrToggle<cr>


" TagsManager:
" Vista:
let g:vista_sidebar_position = 'vertical botright'
let g:vista_sidebar_width = 35
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 0
let g:vista_default_executive = 'ctags'

nnoremap <silent>T <cmd>Vista!!<cr>


" Undo Backup Swap:
set nobackup
set swapfile

if empty(glob('~/.cache/nvim/swap'))
    silent !mkdir -p ~/.cache/nvim/swap
endif

set dir=~/.cache/nvim/swap/

if empty(glob('~/.cache/nvim/undo'))
    silent !mkdir -p ~/.cache/nvim/undo/
endif

if has('persistent_undo')
    set undofile
    set undodir=~/.cache/nvim/undo/
endif


" Dadbod:
let g:db_ui_save_location  = '~/.config/nvim/connections.json'
let g:db_ui_winwidth = 35


" Floaterm:
let g:neoterm_autoscroll = 1
let g:floaterm_borderchars = ['─', '│', '─', '│', '┌', '┐', '┘', '└']
let g:floaterm_width = 0.99
let g:floaterm_height = 0.99
let g:floaterm_position = "top"

tnoremap <silent><c-o> <c-\><c-n>
tnoremap <silent><c-g><cr> <cmd>FloatermToggle<cr>

nnoremap <silent><c-g><cr> <cmd>FloatermToggle<cr>

autocmd TermOpen term://* startinsert


" AsyncrunAndAsyncTask:
" tab run
let g:asyncrun_status = ''
let g:asyncrun_open = 9
let g:asynctasks_term_pos = 'TAB'
let g:asynctasks_term_reuse = 1
let g:asyncrun_rootmarks = [
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

nnoremap <silent><space>r <cmd>AsyncTask run<cr>
nnoremap <space>R :AsyncTask<space>


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
            \ 'coc-yank',
            \ 'coc-explorer',
            \ 'coc-leetcode'
            \ ]

" show documentation
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
        nnoremap <silent><buffer> q <cmd>q<cr>
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

nnoremap <silent>gh <cmd>call <sid>show_documentation()<cr>

" coc-snippets
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'

vmap <silent><c-j> <plug>(coc-snippets-select)

" file explorer
nmap <silent>t <cmd>CocCommand explorer --sources=file+<cr>

" variable rename
nmap <silent>cn <plug>(coc-rename)

" refactor function
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

" git chunk jump
nmap <silent><leader>j <plug>(coc-git-nextchunk)
nmap <silent><leader>k <plug>(coc-git-prevchunk)

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
nnoremap <silent><space>l <cmd>CocList<cr>
nnoremap <silent><space>d <cmd>CocList diagnostics<cr>
nnoremap <silent><space>y <cmd>CocList yank<cr>
nnoremap <silent><space>f <cmd>CocList --regex files<cr>
nnoremap <silent><space>b <cmd>CocList buffers<cr>
nnoremap <silent><space>w <cmd>CocList words<cr>
nnoremap <silent><space>g <cmd>CocList grep<cr>
nnoremap <silent><space>m <cmd>CocList marks<cr>
nnoremap <silent><space>h <cmd>CocList --regex mru -A<cr>

nnoremap <silent><space>c <cmd>CocCommand<cr>
nnoremap <silent><c-y> <cmd>CocCommand editor.action.organizeImport<cr>

nnoremap <silent><leader>a <cmd>CocCommand git.chunkStage<cr>
nnoremap <silent><leader>u <cmd>CocCommand git.chunkUndo<cr>
nnoremap <silent><leader>p <cmd>CocCommand git.chunkInfo<cr>
nnoremap <silent><leader>y <cmd>CocCommand git.copyUrl<cr>
nnoremap <silent><leader>s <cmd>CocCommand git.showCommit<cr>
nnoremap <silent><leader>f <cmd>CocCommand git.foldUnchanged<cr>
nnoremap <silent><leader>b <cmd>CocCommand git.browserOpen<cr>

" organizeImport
autocmd BufWritePre *.go silent call CocAction('runCommand', 'editor.action.organizeImport')


" Languages:
" Go:
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 0


" Javascript:
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1


" Markdown:
" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 0

" markdown-preview
let g:mkdp_browser = 'chromium'
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_worl = 0
let g:mkdp_open_ip = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
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
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '${name}'


" MarkdownSpell:
autocmd BufReadPre,BufNewFile *.md setlocal spell spelllang=en_us,cjk

nnoremap <silent><c-g>s <cmd>set spell!<cr>


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

nnoremap <silent><c-u> :call init#up(&scroll,5,1)<cr>
nnoremap <silent><c-d> :call init#down(&scroll,5,1)<cr>


" Comment:
augroup Comment for different filetype
    autocmd!
    autocmd FileType python,sh setlocal commentstring=#\ %s
    autocmd FileType c,cpp setlocal commentstring=//\ %s
    autocmd FileType markdown,md setlocal commentstring=<!--\ %s-->
    autocmd FileType sql setlocal commentstring=--\ %s
    autocmd BufNewFile,BufRead *.ini,*.conf setlocal commentstring=#\ %s
augroup END


" Hlsearch:
autocmd BufReadPre * setlocal nohlsearch

nnoremap <silent><nowait><expr><c-g>h &hlsearch ? "<cmd>set nohlsearch<cr>" : "<cmd>set hlsearch<cr>"


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
    autocmd FileType go inoremap <buffer><c-l> fmt.Println()<left>
    autocmd FileType python inoremap <buffer><c-l> print()<left>
    autocmd FileType sh inoremap <buffer><c-l> echo ""<left>
augroup END


" Visual_IA:
function! Force_blockwise(next_key)
    return s:setup_keyseq_table[a:next_key][mode()]
endfunction

let s:setup_keyseq_table = {
\   'I': {'v': "\<C-v>I", 'V': "\<C-v>^o^I", "\<C-v>": 'I'},
\   'A': {'v': "\<C-v>A", 'V': "\<C-v>0o$A", "\<C-v>": 'A'},
\ }

vnoremap <expr> <plug>(niceblock-I)  Force_blockwise('I')
vnoremap <expr> <plug>(niceblock-A)  Force_blockwise('A')

if !exists('g:niceblock_no_default_key_mappings') ||
\  !g:niceblock_no_default_key_mappings
    silent! xmap <unique> I  <plug>(niceblock-I)
    silent! xmap <unique> A  <plug>(niceblock-A)
endif


" Cleanbuffers:
command! -nargs=? -complete=buffer -bang CleanBuffers
CleanBuffers    \ :call CleanBuffers('<bang>')

function! CleanBuffers(bang)
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


" FullToggle:
command! FullToggle call s:FullToggle()

function! s:FullToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction

noremap <silent><c-w>f <cmd>FullToggle<cr>
