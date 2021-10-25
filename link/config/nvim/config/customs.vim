" Strengthen_operations:
""" smooth scroll """
""
function! customs#up(dist, duration, speed) abort
    call s:customs('u', a:dist, a:duration, a:speed)
endfunction

function! customs#down(dist, duration, speed) abort
    call s:customs('d', a:dist, a:duration, a:speed)
endfunction

function! s:customs(dir, dist, duration, speed) abort
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

function! s:get_ms_since(time) abort
    let cost = split(reltimestr(reltime(a:time)), '\.')
    return str2nr(cost[0])*1000 + str2nr(cost[1])/1000.0
endfunction

nnoremap <silent><c-u> :call customs#up(&scroll,5,1)<cr>
nnoremap <silent><c-d> :call customs#down(&scroll,5,1)<cr>

""" can use I, V in visual mode """
""
function! Force_blockwise(next_key) abort
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

function! FullToggle(bang) abort
    if exists('t:maximizer_sizes')
        call s:restore()
    elseif winnr('$') > 1
        call s:maximize()
    endif
endfunction

function! s:maximize() abort
    let t:maximizer_sizes = { 'before': winrestcmd() }
    vert resize | resize
    let t:maximizer_sizes.after = winrestcmd()
    normal! ze
endfunction

function! s:restore() abort
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

""" loop in insert mode """
""
let s:DEFAULT_CONTEXT = {}

function! Loop(...)
    return s:smartchar(!0, a:000)
endfunction

function! s:smartchar(loop_p, args)
    let last_arg = a:args[-1]
    if type(last_arg) == type({})
        let context = last_arg
        let _literals = a:args[:-2]
    else
        let context = s:DEFAULT_CONTEXT
        let _literals = a:args
    endif

    if a:loop_p
        let literals = _literals + [_literals[0]]
    else
        let literals = _literals
    endif

    if s:in_valid_context_p(context)
        for i in range(len(literals) - 1, 1, -1)
            let literal1 = literals[i]
            let literal2 = literals[i-1]

            if s:cursor_preceded_with_p(literal2)
                return (pumvisible() ? "\<C-e>" : '')
                     \ . repeat("\<BS>", strchars(literal2))
                     \ . literal1
            endif
        endfor

    return literals[0]
    else
        return get(context, 'fallback', _literals[-1])
    endif
endfunction

function! s:in_valid_context_p(context)
    if has_key(a:context, 'ctype')
        return (mode() ==# 'c'
        \       ? 0 <= stridx(a:context.ctype, getcmdtype())
        \       : !0)
    else
    " Valild context is not specified - smartchr is enabled in any context.
    return !0
    endif
endfunction

function! s:cursor_preceded_with_p(s)
    if mode()[0] ==# 'c'
    " Command-line mode.
      " getcmdpos() is 1-origin and we want to the position of the character
      " just before the cursor.
        let p = getcmdpos() - 1 - 1
        let l = len(a:s)
        return l <= p + 1 && getcmdline()[p - l + 1: p] ==# a:s
    else
        " Insert mode and other modes except Commnd-line mode.
        return search('\V' . escape(a:s, '\') . '\%#', 'bcn')
    endif
endfunction

augroup Golang SmartChar
    autocmd!
    autocmd FileType go inoremap <buffer><expr> ; Loop(';', ':=')
    autocmd FileType go inoremap <buffer><expr> , Loop(',', '<-')
augroup END


" Commands:
""" clear space at the end of a line """
""
command! ClearSpaces %s/\s\+$//g

""" clear buffers """
""
command! -nargs=? -complete=buffer -bang CleanBuffers
            \ :call s:clearbuffers('<bang>')

function! s:clearbuffers(bang) abort
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

function! s:open_diff() abort
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

function! s:autosave(enable) abort
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
autocmd FileType markdown setlocal spell spelllang=en_us,cjk
autocmd FileType markdown let g:markdown_fenced_languages = [
            \ 'go',
            \ 'python',
            \ 'bash',
            \ 'javascript',
            \ 'html',
            \ 'vim'
            \ ]

" term
autocmd TermOpen term://* startinsert

" floaterm
autocmd FileType floaterm map <buffer><c-p> <nop>

" save the cursor position
autocmd BufReadPost * if line("'\"")>1 && line("'\"") <= line("$") && &filetype != 'gitcommit' | exe "normal! g'\"" | endif

" yank highlight
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="Visual", timeout=700}
