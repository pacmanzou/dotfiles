""" statusline """
"" dependence: coc
function! StatusLine() abort
    let s = ''
    let s .= '%f %h%w%m%r  %{StatusDiagnostic()}'
    let s .= '%='
    let s .= '   %l,%c%V          %P'
    return s
endfunction

" coc
function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    let msgs = []
    if get(info, 'error', 0)
        call add(msgs, '' . info['error'].' ')
    endif
    if get(info, 'hint', 0)
        call add(msgs, '' . info['hint'].' ')
    endif
    if get(info, 'info', 0)
        call add(msgs, '' . info['info'].' ')
    endif
    if get(info, 'warning', 0)
        call add(msgs, '' . info['warning'])
    endif
    return join(msgs,'')
endfunction

set statusline=%!StatusLine()
