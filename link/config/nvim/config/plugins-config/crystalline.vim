" dependence: coc, fugitive, gitgutter, capslock, vista
function! StatusLine(current, width)
    let l:s = ''
    let l:s .= crystalline#mode()
    if a:width > 120
        let l:s .= '%{&hlsearch?"HLSEARCH ":""}%{&spell?"SPELL ":""}%{CapsLockStatusline()} %F%h%w%m%r  %{StatusDiagnostic()}%{NearestMethodOrFunction()}'
    else
        let l:s .= '%{&hlsearch?"HLSEARCH ":""}%{&spell?"SPELL ":""}%{CapsLockStatusline()} %f%h%w%m%r  %{StatusDiagnostic()}%{NearestMethodOrFunction()}'
    endif
    let l:s .= '%='
    if a:width > 80
        let l:s .= '%{GitStatus()}  %{FugitiveStatusline()}  %l/%L  %{&ft}[%{&fenc!=#""?&fenc:&enc}] '
    else
        let l:s .= ''
    endif
    return l:s
endfunction

" coc
function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    let msgs = []
    if get(info, 'error', 0) || get(info, 'warning', 0)
        call add(msgs, 'X' . info['error'].' ')
        call add(msgs, ' ' . info['warning'].'  ')
    endif
    return join(msgs,'')
endfunction

" vista
function! NearestMethodOrFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
endfunction

" gitgutter
function! GitStatus()
    let [a,m,r] = GitGutterGetHunkSummary()
    if a == 0 && m == 0 && r == 0 | return '' | endif
    return printf('+%d ~%d -%d', a, m, r)
endfunction

let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_theme = 'pacmanzou'

set tabline=%!crystalline#bufferline(0,0,1)
