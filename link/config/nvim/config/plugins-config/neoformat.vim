let g:neoformat_enabled_go = ['gofmt']
let g:neoformat_enabled_python = ['black']
let g:neoformat_enabled_sh = ['shfmt']
let g:neoformat_enabled_json = ['jsbeautify']
let g:neoformat_enabled_sql = ['pg_format']
let g:neoformat_enabled_javascript = ['jsbeautify']
let g:neoformat_enabled_html = ['htmlbeautify']
let g:neoformat_enabled_css = ['cssbeautify']
let g:neoformat_enabled_markdown = ['prettier']
let g:neoformat_enabled_c = ['astyle']
let g:neoformat_enabled_cpp = ['astyle']

" when a filetype is not found
let g:neoformat_basic_format_align = 0
let g:neoformat_basic_format_retab = 0

" del $ space
let g:neoformat_basic_format_trim = 0

" comment
augroup Comment for different filetype
    autocmd!
    autocmd FileType python,sh setlocal commentstring=#\ %s
    autocmd FileType c,cpp setlocal commentstring=//\ %s
    autocmd FileType markdown,md setlocal commentstring=<!--\ %s-->
    autocmd FileType sql setlocal commentstring=--\ %s
    autocmd BufNewFile,BufRead *.ini,*.conf setlocal commentstring=#\ %s
augroup END

nnoremap <silent><c-g>f :Neoformat<cr>
nnoremap <silent><c-g><c-f> :Neoformat<cr>
