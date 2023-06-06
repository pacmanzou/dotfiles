" Mappings
map g <nop>
map z <nop>
map s <nop>
map Q <nop>
map S <nop>
map Z <nop>
map [ <nop>
map ] <nop>
map <C-q> <nop>
map <C-w> <nop>
map <C-n> <nop>
map <C-o> <nop>
map <C-p> <nop>
map <C-g> <nop>
map <C-s> <nop>
map <C-t> <nop>
map <C-x> <nop>
map <C-y> <nop>
map <C-z> <nop>
map <C-\> <nop>
map <C-]> <nop>
map <C-^> <nop>
map <C-_> <nop>
map <CR>  <nop>
map <BS>  <nop>
map <Space> <nop>

" Windows focus
noremap <silent> <C-l> <C-w>l
noremap <silent> <C-h> <C-w>h
noremap <silent> <C-j> <C-w>j
noremap <silent> <C-k> <C-w>k

" Cursor move
noremap <silent> <C-e> $
noremap <silent> <C-a> ^
noremap <silent> J <C-e>
noremap <silent> K <C-y>
noremap <silent> gg gg

" Focus move
nnoremap zh zt
nnoremap zm zz
nnoremap zl zb

" Visual select
nnoremap <silent> gV ggVG$

" Windows exchange
nnoremap <silent> <C-w>t <C-w>T
nnoremap <silent> <C-w>h <C-w>H
nnoremap <silent> <C-w>j <C-w>J
nnoremap <silent> <C-w>k <C-w>K
nnoremap <silent> <C-w>l <C-w>L
nnoremap <silent> <C-w>o <C-w>o
nnoremap <silent> <C-w>= <C-w>=

" Fold
nnoremap zo zO
nnoremap zO zR
nnoremap zc zC
nnoremap zC zM

" Tab switch
nnoremap <silent> <tab>   :tabnext<CR>
nnoremap <silent> <s-tab> :tabprevious<CR>

" Copy name, path, directory
nnoremap <silent> yn :let @+=expand('%')<CR>
nnoremap <silent> yp :let @+=expand('%:p')<CR>
nnoremap <silent> yd :let @+=getcwd()<CR>

" Jumps
nnoremap <silent> <C-n> <C-i>
nnoremap <silent> <C-p> <C-o>

" Substitute
nnoremap <Space>s :%s///gI<left><left><left><left>
vnoremap <Space>s :s///gI<left><left><left><left>

" Set x delete without copying
nnoremap <silent> x "_x
nnoremap <silent> X "_D
vnoremap <silent> x "_x
vnoremap <silent> X "_X

" Quickily +, -
nnoremap <silent> + <C-a>
nnoremap <silent> - <C-x>
vnoremap <silent> + g<C-a>
vnoremap <silent> - g<C-x>

" Hlsearch
nnoremap <silent> <esc> :set nohlsearch<CR>
nnoremap <silent> <enter> :set hlsearch<CR>

" Misc
nnoremap <silent> q: <nop>
nnoremap <silent> Q @q
nnoremap <silent> > >>
nnoremap <silent> < <<
nnoremap <silent> Y y$
nnoremap <silent> gf <C-w>gf

" Imap
imap <C-@> <nop>
imap <C-q> <nop>
imap <C-r> <nop>
imap <C-o> <nop>
imap <C-s> <nop>
imap <C-g> <nop>
imap <C-j> <nop>
imap <C-k> <nop>
imap <C-l> <nop>
imap <C-z> <nop>
imap <C-x> <nop>
imap <C-v> <nop>
imap <C-\> <nop>
imap <C-]> <nop>
imap <C-f> <right>
imap <C-b> <left>
imap <C-d> <delete>
imap <C-h> <backspace>
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-l> <C-o>zt

" Cmap
cmap <C-q> <nop>
cmap <C-r> <nop>
cmap <C-t> <nop>
cmap <C-y> <nop>
cmap <C-o> <nop>
cmap <C-s> <nop>
cmap <C-g> <nop>
cmap <C-j> <nop>
cmap <C-k> <nop>
cmap <C-l> <nop>
cmap <C-z> <nop>
cmap <C-x> <nop>
cmap <C-v> <nop>
cmap <C-a> <home>
cmap <C-e> <end>
cmap <C-f> <right>
cmap <C-b> <left>
cmap <C-d> <delete>
