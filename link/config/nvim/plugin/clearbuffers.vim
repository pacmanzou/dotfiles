" Clear unfocus buffers
" ---
"
" Commands:
" - ClearBuffers

if exists('g:loaded_clearbuffers')
	finish
endif
let g:loaded_clearbuffers = 1

function! s:clearbuffers(bang) abort
    let last_buf = bufnr('$')

    let del_cnt = 0
    let bufn = 1

    while bufn <= last_buf
        if buflisted(bufn) && bufwinnr(bufn) == -1
            if a:bang == '' && getbufvar(bufn, '&modified')
                echohl WarningMsg
                echo 'No write since last change for buffer(add ! to override)'
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

command! -nargs=? -complete=buffer -bang CleanBuffers
            \ :call s:clearbuffers('<bang>')
