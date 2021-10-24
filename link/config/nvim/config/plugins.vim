call plug#begin('$HOME/.config/nvim/plugged')

" appearance
Plug 'luochen1990/rainbow'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'RRethy/vim-illuminate', {'on': []}
Plug 'RRethy/vim-hexokinase', {'do': 'make hexokinase', 'on': []}

" operation
Plug 'pacmanzou/surround.vim', {'on': []}
Plug 'tpope/vim-commentary', {'on': []}
Plug 'tpope/vim-abolish', {'on': []}
Plug 'tpope/vim-repeat', {'on': []}
Plug 'junegunn/vim-easy-align', {'on': []}
Plug 'tommcdo/vim-exchange', {'on': []}
Plug 'kana/vim-smartchr', {'on': []}
Plug 'lpinilla/vim-codepainter', {'on': []}
Plug 'AndrewRadev/splitjoin.vim', {'on': []}

" format
Plug 'sbdchd/neoformat', {'on': []}

" term
Plug 'voldikss/vim-floaterm', {'on': []}

" tags
Plug 'liuchengxu/vista.vim', {'on': []}

" run code
Plug 'skywind3000/asyncrun.vim', {'on': []}
Plug 'skywind3000/asynctasks.vim', {'on': []}

" completion
Plug 'neoclide/coc.nvim', {'branch': 'release', 'on': []}
Plug 'wellle/tmux-complete.vim', {'on': []}

" debug
" Plug 'puremourning/vimspector'

" go
Plug 'pacmanzou/go-syntax.vim', {'for': 'go'}

" markdown
Plug 'mzlogin/vim-markdown-toc', {'on': []}
Plug 'ferrine/md-img-paste.vim', {'on': []}
Plug 'iamcco/markdown-preview.nvim', {
            \ 'do': 'cd app && yarn install',
            \ 'on': []
            \ }

call plug#end()
