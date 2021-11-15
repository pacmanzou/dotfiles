" Full current focus window

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

map <silent> <c-w>f :call FullToggle('<bang>')<cr>
map <silent> <c-w><c-f> :call FullToggle('<bang>')<cr>
