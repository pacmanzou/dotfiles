" Smooth_scroll:
" scroll the screen up
function! functions#up(dist, duration, speed)
    call s:functions('u', a:dist, a:duration, a:speed)
endfunction

" scroll the screen down
function! functions#down(dist, duration, speed)
    call s:functions('d', a:dist, a:duration, a:speed)
endfunction

" animation
function! s:functions(dir, dist, duration, speed)
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

nnoremap <silent><c-u> :call functions#up(&scroll,5,1)<cr>
nnoremap <silent><c-d> :call functions#down(&scroll,5,1)<cr>


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
            \     echohl WarningMsg |
            \     echomsg 'WARNING: Coc is dead for this huge file!' |
            \     echohl None |
            \ else |
            \     call timer_start(100,'CocTimerStart',{'repeat':1}) |
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
            \ !g:niceblock_no_default_key_mappings
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

map <silent><c-w>f :FullToggle<cr>
map <silent><c-w><c-f> :FullToggle<cr>


" Cleanbuffers:
command! -nargs=? -complete=buffer -bang CleanBuffers
            \ :call CleanBuffers('<bang>')

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


" SudoWrite:
command! W w !sudo tee > /dev/null %


" Diff:
function! s:open_diff()
	" Open diff window and start comparison
	let l:bnr = bufnr('%')
	call setwinvar(winnr(), 'diff_origin', l:bnr)
	vertical new __diff
	let l:diff_bnr = bufnr('%')
	setlocal buftype=nofile bufhidden=wipe
	r ++edit #
	0d_
	diffthis
    setlocal readonly
	wincmd p
	let b:diff_bnr = l:diff_bnr
	diffthis
endfunction

command! -nargs=0 Difforig call s:open_diff()


" AutoSave:
function! s:autosave(enable)
  augroup autosave
    autocmd!
    if a:enable
      autocmd TextChanged,InsertLeave <buffer>
            \  if empty(&buftype) && !empty(bufname(''))
            \|   silent! update
            \| endif
    endif
  augroup END
endfunction

command! -bang AutoSave call s:autosave(<bang>1)
