" vim-plug
let g:plug_window = '-tabnew'

call plug#begin('$HOME/.config/nvim/plugged')
" appearance
Plug 'luochen1990/rainbow'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'fatih/vim-go',{'do': ':GoUpdateBinaries', 'for': ['go', 'gomod']}

" global
Plug 'RRethy/vim-illuminate',      {'on': []}
Plug 'RRethy/vim-hexokinase',      {'do': 'make hexokinase', 'on': []}
Plug 'pacmanzou/surround.vim',     {'on': []}
Plug 'tpope/vim-commentary',       {'on': []}
Plug 'tpope/vim-abolish',          {'on': []}
Plug 'tpope/vim-repeat',           {'on': []}
Plug 'junegunn/vim-easy-align',    {'on': []}
Plug 'tommcdo/vim-exchange',       {'on': []}
Plug 'lpinilla/vim-codepainter',   {'on': []}
Plug 'AndrewRadev/splitjoin.vim',  {'on': []}
Plug 'sbdchd/neoformat',           {'on': []}
Plug 'voldikss/vim-floaterm',      {'on': []}
Plug 'liuchengxu/vista.vim',       {'on': []}
Plug 'neoclide/coc.nvim',          {'branch': 'release', 'on': []}

" markdown
Plug 'mzlogin/vim-markdown-toc',     {'on': []}
Plug 'ferrine/md-img-paste.vim',     {'on': []}
Plug 'iamcco/markdown-preview.nvim', {
            \ 'do': 'cd app && yarn install',
            \ 'on': []
            \ }
call plug#end()

function! SourceList(path) abort
    let s:sourceList = a:path

    for s:item in s:sourceList
        exec 'source '. s:item
    endfor

    unlet s:item
    unlet s:sourceList
endfunction

function! LoadGlobalPlugins(timer) abort
    " load global plugins
    call plug#load(
                \ 'vim-illuminate',
                \ 'vim-hexokinase',
                \ 'surround.vim',
                \ 'vim-commentary',
                \ 'vim-abolish',
                \ 'vim-repeat',
                \ 'vim-easy-align',
                \ 'vim-exchange',
                \ 'vim-codepainter',
                \ 'splitjoin.vim',
                \ 'neoformat',
                \ 'vim-floaterm',
                \ 'vista.vim',
                \ 'coc.nvim'
                \ )

    " source global plugins config
    call SourceList(split(glob('$HOME/.config/nvim/config/plugins/global/*.vim')))
endfunction

function! LoadMarkdownPlugins(timer) abort
    " load markdown plugins
    call plug#load(
                \ 'vim-markdown-toc',
                \ 'md-img-paste.vim',
                \ 'markdown-preview.nvim'
                \ )

    " source markdown plugins config
    call SourceList(split(glob('$HOME/.config/nvim/config/plugins/markdown/*.vim')))
endfunction

" appearance
" appearance plugins need to be loaded directly
" source appearance plugins config
call SourceList(split(glob('$HOME/.config/nvim/config/plugins/appearance/*.vim')))

" global
autocmd VimEnter * call timer_start(100, 'LoadGlobalPlugins', {'repeat': 1})

" markdown
autocmd FileType markdown call timer_start(200, 'LoadMarkdownPlugins', {'repeat': 1})
