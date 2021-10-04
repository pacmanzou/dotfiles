" nop z
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

" nop <c-w>
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
map <c-y> <nop>
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

" imap:
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

" cmd:
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
nnoremap <silent><c-w><c-t> <c-w>T
nnoremap <silent><c-w>h <c-w>H
nnoremap <silent><c-w><c-h> <c-w>H
nnoremap <silent><c-w>j <c-w>J
nnoremap <silent><c-w><c-j> <c-w>J
nnoremap <silent><c-w>k <c-w>K
nnoremap <silent><c-w><c-k> <c-w>K
nnoremap <silent><C-w>l <c-w>L
nnoremap <silent><C-w><c-l> <c-w>L

" fold
nnoremap zo zO
nnoremap zO zR
nnoremap zc zC
nnoremap zC zM

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

noremap <silent>+ <c-a>
noremap <silent>- <c-x>

vnoremap <silent>+ g<c-a>
vnoremap <silent>- g<c-x>

nnoremap / mr/\v
nnoremap <silent>Y y$
nnoremap <silent>> >>
nnoremap <silent>< <<
nnoremap <silent>Q @q
nnoremap <silent>gF <c-w>f
