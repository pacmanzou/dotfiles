" Smooth scorll

function! SmoothUp(dist, duration, speed) abort
    call s:smoothscroll('u', a:dist, a:duration, a:speed)
endfunction

function! SmoothDown(dist, duration, speed) abort
    call s:smoothscroll('d', a:dist, a:duration, a:speed)
endfunction

function! s:smoothscroll(dir, dist, duration, speed) abort
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

nnoremap <silent><c-u> :call SmoothUp(&scroll,5,1)<cr>
nnoremap <silent><c-d> :call SmoothDown(&scroll,5,1)<cr>