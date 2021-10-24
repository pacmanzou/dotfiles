augroup All SmartChr
    autocmd!
    autocmd FileType * inoremap <buffer><expr> !
                \ smartchr#loop('!', '!=')
augroup END

augroup Golang SmartChr
    autocmd!
    autocmd FileType go inoremap <buffer><expr> ;
                \ smartchr#loop(';', ':=')
    autocmd FileType go inoremap <buffer><expr> ,
                \ smartchr#loop(',', '<-')
augroup END

augroup Python SmartChr
    autocmd!
    autocmd FileType python inoremap <buffer><expr> .
                \ smartchr#loop('.', '->')
augroup END

augroup Sh SmartChr
    autocmd!
    autocmd FileType sh inoremap <buffer><expr> $
                \ smartchr#loop('$', '"${}"<Left><Left>')
augroup END
