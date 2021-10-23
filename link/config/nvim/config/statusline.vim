""" statusline """
"" dependence: coc and coc-git
function! StatusLine()
    let s = ''
    let s .= '%{ModeIs()}'
    let s .= '%{&hlsearch?"HLSEARCH ":""}%{&spell?"SPELL ":""} %f%h%w%m%r  %{StatusDiagnostic()}'
    let s .= '%='
    let s .= '%{GitstatusB()} %{GitstatusG()}  %l/%L  %{&ft}[%{&fenc!=#""?&fenc:&enc}] '
    return s
endfunction

" check in which mode
function! ModeIs() abort
    if mode() =~# '[nc]'
        return '  NORMAL '
    elseif mode() =~# '[it]'
        return '  INSERT '
    elseif mode() =~# '[vVsS]'
        return '  VISUAL '
    elseif mode() ==# 'R'
        return '  REPLACE '
    endif
    return ''
endfunction

" coc
function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    let msgs = []
    if get(info, 'error', 0)
        call add(msgs, ' ' . info['error'].' ')
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

set statusline=%!StatusLine()

""" tabline """
""
function! TabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " select the highlighting
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        let s .= ' %{TabLabel(' . (i + 1) . ')} '
    endfor
    return s
endfunction

function! TabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let name = bufname(buflist[winnr - 1])
    let label = fnamemodify(name, ':t')
    return len(label) == 0 ? '[No Name]' :  label
endfunction

set tabline=%!TabLine()
