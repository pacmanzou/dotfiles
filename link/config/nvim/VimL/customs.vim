" Strengthen_operations:
""" smooth scroll """
""
function! customs#up(dist, duration, speed)
    call s:customs('u', a:dist, a:duration, a:speed)
endfunction

function! customs#down(dist, duration, speed)
    call s:customs('d', a:dist, a:duration, a:speed)
endfunction

function! s:customs(dir, dist, duration, speed)
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

nnoremap <silent><c-u> :call customs#up(&scroll,5,1)<cr>
nnoremap <silent><c-d> :call customs#down(&scroll,5,1)<cr>

""" can use I, V in visual mode """
""
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

""" full screen toggle """
""
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

""" package code by indent """
""
function! s:indent_len(str)
    return type(a:str) == 1 ? len(matchstr(a:str, '^\s*')) : 0
endfunction

function! s:indent_object(op, skip_blank, b, e, bd, ed)
    let i = min([s:indent_len(getline(a:b)), s:indent_len(getline(a:e))])
    let x = line('$')
    let d = [a:b, a:e]

    if i == 0 && empty(getline(a:b)) && empty(getline(a:e))
        let [b, e] = [a:b, a:e]
        while b > 0 && e <= line('$')
            let b -= 1
            let e += 1
            let i = min(filter(map([b, e], 's:indent_len(getline(v:val))'), 'v:val != 0'))
            if i > 0
                break
            endif
        endwhile
    endif

    for triple in [[0, 'd[o] > 1', -1], [1, 'd[o] < x', +1]]
        let [o, ev, df] = triple

        while eval(ev)
            let line = getline(d[o] + df)
            let idt = s:indent_len(line)

            if eval('idt '.a:op.' i') && (a:skip_blank || !empty(line)) || (a:skip_blank && empty(line))
                let d[o] += df
            else | break | end
        endwhile
    endfor
    execute printf('normal! %dGV%dG', max([1, d[0] + a:bd]), min([x, d[1] + a:ed]))
endfunction

xnoremap <silent> ii :<c-u>call <SID>indent_object('>=', 1, line("'<"), line("'>"), 0, 0)<cr>
onoremap <silent> ii :<c-u>call <SID>indent_object('>=', 1, line('.'), line('.'), 0, 0)<cr>
xnoremap <silent> ai :<c-u>call <SID>indent_object('>=', 1, line("'<"), line("'>"), -1, 1)<cr>
onoremap <silent> ai :<c-u>call <SID>indent_object('>=', 1, line('.'), line('.'), -1, 1)<cr>


" Commands:
""" clear space at the end of a line """
""
command! ClearSpaces %s/\s\+$//g

""" clear buffers """
""
command! -nargs=? -complete=buffer -bang CleanBuffers
            \ :call ClearBuffers('<bang>')

function! ClearBuffers(bang)
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
        echomsg 'Clear done, ' del_cnt 'buffer(s) cleard'
    endif
endfunction

""" save as root """
""
command! SudoWrite w !sudo tee > /dev/null %

""" real-time diff original file """
""
command! -nargs=0 DiffOrigin call s:open_diff()

function! s:open_diff()
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

""" auto save when exit the insert mode """
""
command! -bang AutoSave call s:autosave(<bang>1)

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


" Autocmds:
" go
autocmd FileType go setlocal noexpandtab

" markdown
autocmd BufReadPre,BufNewFile *.md setlocal spell spelllang=en_us,cjk

" git
autocmd FileType git nnoremap <silent><buffer>q :q<cr>

" qf
autocmd FileType qf nnoremap <silent><buffer>q :q<cr>

" term
autocmd TermOpen term://* startinsert

" floaterm
autocmd FileType floaterm map <buffer><c-p> <nop>

" *
" save the cursor position
autocmd BufReadPost * if line("'\"")>1 && line("'\"") <= line("$") && &filetype != 'gitcommit' | exe "normal! g'\"" | endif
