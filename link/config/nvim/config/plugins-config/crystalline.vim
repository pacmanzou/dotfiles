" dependence: coc, fugitive, gitgutter, capslock
function! StatusLine(current, width)
    let l:s = ''
    if a:current
        let l:s .= crystalline#mode(). crystalline#right_mode_sep('')
    else
        let l:s .= '%#CrystallineInactive#'
    endif
        let l:s .= crystalline#right_sep('', 'Fill')
    if a:current
        let l:s .= '%{&hlsearch?"HLSEARCH ":""}%{&spell?"SPELL ":""}%{CapsLockStatusline()} %h%w%m%r'
    endif
    let l:s .= '%='
    if a:current
        let l:s .= crystalline#left_sep('', 'Fill')
        let l:s .= crystalline#left_mode_sep('')
    endif
    if a:width > 40
        let l:s .= '%{FugitiveStatusline()}  %{GitStatus()}  %{StatusDiagnostic()}  %l/%L  %{&ft}[%{&fenc!=#""?&fenc:&enc}] '
    else
        let l:s .= ''
    endif
    return l:s
endfunction

" coc
function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    let msgs = []
    if get(info, 'error', 0)
        call add(msgs, 'x' . info['error'])
    else
        call add(msgs,'x0')
    endif
    if get(info, 'warning', 0)
        call add(msgs, '!' . info['warning'])
    else
        call add(msgs,'!0')
    endif
    return join(msgs,'')
endfunction

function! CurrentFunction() abort
    let status = get(b:, 'coc_current_function', '')
    return  status
endfunction

" gitgutter
function! GitStatus()
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('+%d~%d-%d', a, m, r)
endfunction

let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_theme = 'pacmanzou'

set tabline=%!crystalline#bufferline(0,0,1)
