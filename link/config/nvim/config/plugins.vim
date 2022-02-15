" vim-plug
let g:plug_window = '-tabnew'

call plug#begin('$HOME/.config/nvim/plugged')
" priority
Plug 'Yggdroot/indentLine'
Plug 'fatih/vim-go',      {'for': ['go', 'gomod']}
Plug 'buoto/gotests-vim', {'for': 'go'}

" primary
Plug 'tpope/vim-repeat',          {'on': []}
Plug 'tomtom/tcomment_vim',       {'on': []}
Plug 'AndrewRadev/splitjoin.vim', {'on': []}
Plug 'junegunn/vim-easy-align',   {'on': []}
Plug 'sbdchd/neoformat',          {'on': []}
Plug 'voldikss/vim-floaterm',     {'on': []}
Plug 'liuchengxu/vista.vim',      {'on': []}
Plug 'neoclide/coc.nvim',         {'on': [], 'branch': 'release'}

" markdown
Plug 'mzlogin/vim-markdown-toc',     {'on': []}
Plug 'ferrine/md-img-paste.vim',     {'on': []}
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
    " load primary plugins
    call plug#load(
                \ 'vim-repeat',
                \ 'tcomment_vim',
                \ 'splitjoin.vim',
                \ 'vim-easy-align',
                \ 'neoformat',
                \ 'vim-floaterm',
                \ 'vista.vim',
                \ 'coc.nvim'
                \ )

    " source primary plugins config
    call s:SourceList(split(glob('$HOME/.config/nvim/config/plugins/primary/*.vim')))
endfunction

function! LoadMarkdownPlugins(timer) abort
    " load markdown plugins
    call plug#load(
                \ 'vim-markdown-toc',
                \ 'md-img-paste.vim',
                \ 'markdown-preview.nvim'
                \ )

    " source markdown plugins config
    call s:SourceList(split(glob('$HOME/.config/nvim/config/plugins/markdown/*.vim')))
endfunction

" load plugins
" priority plugins need to be loaded directly
call s:SourceList(split(glob('$HOME/.config/nvim/config/plugins/priority/*.vim')))

" primary
autocmd VimEnter * call timer_start(100, 'LoadPrimaryPlugins')

" markdown
autocmd FileType markdown call timer_start(200, 'LoadMarkdownPlugins')
