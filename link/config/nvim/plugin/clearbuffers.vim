" Clear unfocus buffers
" ---
"
" Commands:
" - ClearBuffers

if exists('g:loaded_clearbuffers')
    finish
endif
let g:loaded_clearbuffers = 1

function! s:ClearBuffers(bang) abort
    let l:tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(l:tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(l:tpbl, v:val)==-1')
        if getbufvar(buf, '&mod') == 0
            if (getbufvar(buf, '&buftype') != 'terminal' || a:bang)
                silent execute 'bwipeout!' buf
            endif
        endif
    endfor
endfunction

command -bang ClearBuffers call s:ClearBuffers(<bang>0)
