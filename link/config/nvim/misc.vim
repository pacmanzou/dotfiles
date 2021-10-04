" Go_noexpandtab:
autocmd FileType go setlocal noexpandtab


" Markdown_spell:
autocmd BufReadPre,BufNewFile *.md setlocal spell spelllang=en_us,cjk

nnoremap <silent><c-g>s <cmd>setlocal spell!<cr>
nnoremap <silent><c-g><c-s> <cmd>setlocal spell!<cr>


" Smooth_scroll:
" scroll the screen up
function! misc#up(dist, duration, speed)
    call s:misc('u', a:dist, a:duration, a:speed)
endfunction

" scroll the screen down
function! misc#down(dist, duration, speed)
    call s:misc('d', a:dist, a:duration, a:speed)
endfunction

" animation
function! s:misc(dir, dist, duration, speed)
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

nnoremap <silent><c-u> :call misc#up(&scroll,5,1)<cr>
nnoremap <silent><c-d> :call misc#down(&scroll,5,1)<cr>


" Hlsearch:
autocmd BufReadPre * setlocal nohlsearch

nnoremap <silent><nowait><expr><c-g>h &hlsearch ? "<cmd>set nohlsearch<cr>" : "<cmd>set hlsearch<cr>"
nnoremap <silent><nowait><expr><c-g><c-h> &hlsearch ? "<cmd>set nohlsearch<cr>" : "<cmd>set hlsearch<cr>"


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


" FullToggle:
command! -nargs=? -complete=buffer -bang FullToggle
            \ :call FullToggle('<bang>')

function! FullToggle(bang)
    if exists('t:maximizer_sizes')
        call s:restore()
    elseif winnr('$') > 1
        call s:maximize()
    endif
endfunction

function! s:maximize()
    let t:maximizer_sizes = { 'before': winrestcmd() }
    vert resize | resize
    let t:maximizer_sizes.after = winrestcmd()
    normal! ze
endfunction

function! s:restore()
    if exists('t:maximizer_sizes')
        silent! exe t:maximizer_sizes.before
        if t:maximizer_sizes.before != winrestcmd()
            wincmd =
        endif
        unlet t:maximizer_sizes
        normal! ze
    end
endfunction

augroup restore
    autocmd!
    autocmd WinLeave * call s:restore()
augroup END

map <silent><c-w>f <cmd>FullToggle<cr>
map <silent><c-w><c-f> <cmd>FullToggle<cr>
