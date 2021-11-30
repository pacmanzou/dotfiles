" statusline
function! StatusLine() abort
    let s = ''
    let s .= '%f %h%w%m%r  %{StatusDiagnostic()}'
    let s .= '%='
    let s .= '%l,%c%V          %P'

    return s
endfunction

" coc diagnostic
function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    let msgs = []

    if empty(info) | return '' | endif

    if get(info, 'error', 0)
        call add(msgs, 'E' . info['error'].' ')
    endif

    if get(info, 'hint', 0)
        call add(msgs, 'H' . info['hint'].' ')
    endif

    if get(info, 'info', 0)
        call add(msgs, 'I' . info['info'].' ')
    endif

    if get(info, 'warning', 0)
        call add(msgs, 'W' . info['warning'])
    endif

    return join(msgs,'')
endfunction

set statusline=%!StatusLine()
