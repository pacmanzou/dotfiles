" Mappings
map g <nop>
map z <nop>
map s <nop>
map Q <nop>
map S <nop>
map Z <nop>
map [ <nop>
map ] <nop>
map <c-q> <nop>
map <c-w> <nop>
map <c-n> <nop>
map <c-o> <nop>
map <c-p> <nop>
map <c-g> <nop>
map <c-s> <nop>
map <c-t> <nop>
map <c-x> <nop>
map <c-y> <nop>
map <c-z> <nop>
map <c-\> <nop>
map <c-]> <nop>
map <c-^> <nop>
map <c-_> <nop>
map <cr>  <nop>
map <bs>  <nop>
map <space> <nop>

" Windows focus
noremap <silent> <c-l> <c-w>l
noremap <silent> <c-h> <c-w>h
noremap <silent> <c-j> <c-w>j
noremap <silent> <c-k> <c-w>k

" Cursor move
noremap <silent> <c-e> $
noremap <silent> <c-a> ^
noremap <silent> J <c-e>
noremap <silent> K <c-y>
noremap <silent> gg gg

" Focus move
nnoremap zh zt
nnoremap zm zz
nnoremap zl zb

" Visual select
noremap <silent> gV ggVG$

" Windows exchange
nnoremap <silent> <c-w>t <c-w>T
nnoremap <silent> <c-w>h <c-w>H
nnoremap <silent> <c-w>j <c-w>J
nnoremap <silent> <c-w>k <c-w>K
nnoremap <silent> <c-w>l <c-w>L
nnoremap <silent> <c-w>o <c-w>o
nnoremap <silent> <c-w>= <c-w>=

" Fold
nnoremap zo zO
nnoremap zO zR
nnoremap zc zC
nnoremap zC zM

" Tab switch
nnoremap <silent> <tab>   :tabnext<cr>
nnoremap <silent> <s-tab> :tabprevious<cr>

" Copy name, path, directory
nnoremap <silent> yn :let @+=expand('%')<cr>
nnoremap <silent> yp :let @+=expand('%:p')<cr>
nnoremap <silent> yd :let @+=getcwd()<cr>

" Jumps
nnoremap <silent> <c-n> <c-i>
nnoremap <silent> <c-p> <c-o>

" Substitute
nnoremap <space>s :%s///gI<left><left><left><left>
vnoremap <space>s :s///gI<left><left><left><left>

" Set x delete without copying
nnoremap <silent> x "_x
nnoremap <silent> X "_D
vnoremap <silent> x "_x
vnoremap <silent> X "_X

" Quickily +, -
nnoremap <silent> + <c-a>
nnoremap <silent> - <c-x>
vnoremap <silent> + g<c-a>
vnoremap <silent> - g<c-x>

" Hlsearch
nnoremap <silent> <esc> :set nohlsearch<cr>
nnoremap <silent> <enter> :set hlsearch<cr>

" Misc
nnoremap <silent> Q @q
nnoremap <silent> > >>
nnoremap <silent> < <<
nnoremap <silent> Y y$
nnoremap <silent> gf <c-w>gf

" Imap
imap <c-@> <nop>
imap <c-q> <nop>
imap <c-r> <nop>
imap <c-o> <nop>
imap <c-s> <nop>
imap <c-g> <nop>
imap <c-j> <nop>
imap <c-k> <nop>
imap <c-l> <nop>
imap <c-z> <nop>
imap <c-x> <nop>
imap <c-v> <nop>
imap <c-\> <nop>
imap <c-]> <nop>

inoremap <c-a> <c-o>^
inoremap <c-e> <c-o>$
inoremap <c-f> <right>
inoremap <c-b> <left>
inoremap <c-h> <backspace>
inoremap <c-l> <c-o>zt
inoremap <c-d> <delete>

" Cmap
cmap <c-q> <nop>
cmap <c-r> <nop>
cmap <c-t> <nop>
cmap <c-y> <nop>
cmap <c-o> <nop>
cmap <c-s> <nop>
cmap <c-g> <nop>
cmap <c-j> <nop>
cmap <c-k> <nop>
cmap <c-l> <nop>
cmap <c-z> <nop>
cmap <c-x> <nop>
cmap <c-v> <nop>

cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <right>
cnoremap <c-b> <left>
cnoremap <c-d> <delete>
