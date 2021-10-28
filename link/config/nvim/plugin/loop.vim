" Loop in insert mode

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
