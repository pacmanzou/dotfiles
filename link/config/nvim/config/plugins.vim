" vim-plug
let g:plug_window = '-tabnew'

call plug#begin('$HOME/.config/nvim/plugged')
" priority
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries', 'for': ['go', 'gomod']}

" primary
Plug 'pacmanzou/surround.vim',     {'on': []}
Plug 'tpope/vim-repeat',           {'on': []}
Plug 'tomtom/tcomment_vim',        {'on': []}
Plug 'junegunn/vim-easy-align',    {'on': []}
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

function! LoadprimaryPlugins(timer) abort
    " load primary plugins
    call plug#load(
                \ 'surround.vim',
                \ 'vim-repeat',
                \ 'tcomment_vim',
                \ 'vim-easy-align',
                \ 'splitjoin.vim',
                \ 'neoformat',
                \ 'vim-floaterm',
                \ 'vista.vim',
                \ 'coc.nvim'
                \ )

    " source primary plugins config
    call SourceList(split(glob('$HOME/.config/nvim/config/plugins/primary/*.vim')))
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

" load plugins
" priority plugins need to be loaded directly
call SourceList(split(glob('$HOME/.config/nvim/config/plugins/priority/*.vim')))

" primary
autocmd VimEnter * call timer_start(100, 'LoadprimaryPlugins', {'repeat': 1})

" markdown
autocmd FileType markdown call timer_start(200, 'LoadMarkdownPlugins', {'repeat': 1})
