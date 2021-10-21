" dependence: coc, coc-git, capslock
function! StatusLine(current, width)
    let l:s = ''
    let l:s .= crystalline#mode()
    if a:width > 120
        let l:s .= '%{CapsLockStatusline()}%{&hlsearch?"HLSEARCH ":""}%{&spell?"SPELL ":""} %F%h%w%m%r  %{StatusDiagnostic()}'
    else
        let l:s .= '%{CapsLockStatusline()}%{&hlsearch?"HLSEARCH ":""}%{&spell?"SPELL ":""} %f%h%w%m%r  %{StatusDiagnostic()}'
    endif
    let l:s .= '%='
    if a:width > 80
        let l:s .= '%{GitstatusB()} %{GitstatusG()}  %l/%L  %{&ft}[%{&fenc!=#""?&fenc:&enc}] '
    else
        let l:s .= ''
    endif
    return l:s
endfunction

let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_theme = 'pacmanzou'

set tabline=%!crystalline#bufferline(0,0,1)

" coc
function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    let msgs = []
    if get(info, 'error', 0)
        call add(msgs, 'X' . info['error'].' ')
    endif
    if get(info, 'warning', 0)
        call add(msgs, ' ' . info['warning'])
    endif
    return join(msgs,'')
endfunction

" coc-git
function! GitstatusG() abort
    let status = get(g:, 'coc_git_status', '')
    return  status
endfunction

function! GitstatusB() abort
    let status = get(b:, 'coc_git_status', '')
    return  status
endfunction
