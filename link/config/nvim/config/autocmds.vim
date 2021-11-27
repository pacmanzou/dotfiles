" save the cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" yank highlight
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="Visual", timeout=700}

" map in a special filetype
function! SpecialMap()
    if (index([''], &filetype) >= 0)
        map <buffer> <c-n> <nop>
        map <buffer> <c-p> <nop>
    elseif (index(['list'], &filetype) >= 0)
        map <buffer> <c-n> <nop>
        map <buffer> <c-p> <nop>
        map <buffer> <c-d> <nop>
        map <buffer> <c-u> <nop>
        map <buffer> <c-b> <nop>
        map <buffer> <c-f> <nop>
    else
        return
    endif
endfunction

autocmd BufEnter * call SpecialMap()
