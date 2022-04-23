let g:neoformat_enabled_go = ['gofumpt']
let g:neoformat_enabled_python = ['black']
let g:neoformat_enabled_sh = ['shfmt']
let g:neoformat_enabled_json = ['prettierd']
let g:neoformat_enabled_sql = ['pg_format']
let g:neoformat_enabled_javascript = ['prettierd']
let g:neoformat_enabled_html = ['prettierd']
let g:neoformat_enabled_css = ['prettierd']
let g:neoformat_enabled_markdown = ['prettierd']

" when the filetype is not found
let g:neoformat_basic_format_align = 0
let g:neoformat_basic_format_retab = 0
let g:neoformat_basic_format_trim = 0

nnoremap <silent> <space>n :Neoformat<cr>
