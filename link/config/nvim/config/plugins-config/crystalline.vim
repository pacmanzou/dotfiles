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
        let l:s .= '%{&hlsearch?"HLSEARCH ":""}%{&spell?"SPELL ":""}%{CapsLockStatusline()}%h%w%m%r %{StatusDiagnostic()}%{NearestMethodOrFunction()}'
    endif
    let l:s .= '%='
    if a:current
        let l:s .= crystalline#left_sep('', 'Fill')
        let l:s .= crystalline#left_mode_sep('')
    endif
    if a:width > 40
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
