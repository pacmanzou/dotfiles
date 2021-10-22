call plug#begin('$HOME/.config/nvim/plugged')

" appearance
Plug 'pacmanzou/crystalline.vim'
Plug 'luochen1990/rainbow'
Plug 'RRethy/vim-illuminate'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'RRethy/vim-hexokinase', {'do': 'make hexokinase'}

" operation
Plug 'pacmanzou/surround.vim'
Plug 'pacmanzou/exchange.vim'
Plug 'pacmanzou/capslock.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-smartchr'
Plug 'sbdchd/neoformat'
Plug 'lpinilla/vim-codepainter'
Plug 'LunarWatcher/auto-pairs'

" term
Plug 'voldikss/vim-floaterm'

" tags
Plug 'liuchengxu/vista.vim'

" run code
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'

" completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wellle/tmux-complete.vim'

" debug
" Plug 'puremourning/vimspector'

" go
Plug 'pacmanzou/go-syntax.vim', {'for': ['go', 'vim-plug']}

" markdown
Plug 'mzlogin/vim-markdown-toc', {'for': ['markdown', 'vim-plug'] }
Plug 'iamcco/markdown-preview.nvim', {
            \ 'do': 'cd app && yarn install',
            \ 'for': ['markdown', 'vim-plug'],
            \ 'on':'MarkdownPreview'
            \ }

call plug#end()
