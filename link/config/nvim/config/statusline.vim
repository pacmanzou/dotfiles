""" statusline """
"" dependence: coc and coc-git
function! s:statuslinefocused() abort
    let s = ''
    let w = winwidth(win_id2win(win_getid()))
    if mode() =~# '[nc]'
        let s .= '-- NORMAL -- '
    elseif mode() =~# '[it]'
        let s .= '-- INSERT -- '
    elseif mode() =~# '[vVsS]'
        let s .= '-- VISUAL -- '
    elseif mode() ==# 'R'
        let s .= '-- REPLACE -- '
    endif
    if w > 120
        let s .= '%{&hlsearch?"HLSEARCH ":""}%{&spell?"SPELL ":""} %F%h%w%m%r  %{StatusDiagnostic()}'
    else
        let s .= '%{&hlsearch?"HLSEARCH ":""}%{&spell?"SPELL ":""} %f%h%w%m%r  %{StatusDiagnostic()}'
    endif
    let s .= '%='
    if w > 80
        let s .= '%{GitstatusB()} %{GitstatusG()}  %l/%L  %{&ft}[%{&fenc!=#""?&fenc:&enc}][%{&ff}]'
    else
        let s .= '%{&ft}[%{&fenc!=#""?&fenc:&enc}][%{&ff}]'
    endif
    return s
endfunction

function! s:statuslineunfocused() abort
    let s = ''
    let s .= '%f%h%w%m%r'
    let s .= '%='
    let s .= '%{&ft}[%{&fenc!=#""?&fenc:&enc}][%{&ff}]'
    return s
endfunction

function! StatusLine() abort
	let s:focused = g:statusline_winid == win_getid(winnr())
    let s:statusline = s:focused ? s:statuslinefocused() : s:statuslineunfocused()
	return s:statusline
endfunction

set statusline=%!StatusLine()

autocmd FileType coc-explorer setlocal statusline=%h%w%m%r

""" tabline """
""
function! TabLine() abort
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

function! TabLabel(n) abort
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let name = bufname(buflist[winnr - 1])
    let label = fnamemodify(name, ':t')
    return len(label) == 0 ? '[No Name]' :  label
endfunction

set tabline=%!TabLine()

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

