" Plug:
let g:plug_window = '-tabnew'


function! GitStatus()
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('+%d~%d-%d', a, m, r)
endfunction

" Crystalline:
function! StatusLine(current, width)
    let l:s = ''
    if a:current
        let l:s .= crystalline#mode(). crystalline#right_mode_sep('')
    else
        let l:s .= '%#CrystallineInactive#'
    endif
        let l:s .= crystalline#right_sep('', 'Fill')
    if a:current
        let l:s .= '%{&hlsearch?"HLSEARCH ":""}%{&spell?"SPELL ":""}%{CapsLockStatusline()} %h%w%m%r'
    endif
    let l:s .= '%='
    if a:current
        let l:s .= crystalline#left_sep('', 'Fill')
        let l:s .= crystalline#left_mode_sep('')
    endif
    if a:width > 40
        let l:s .= '%{FugitiveStatusline()}  %{GitStatus()}  %{StatusDiagnostic()}  %{&ft}[%{&fenc!=#""?&fenc:&enc}] '
    else
        let l:s .= ''
    endif
    return l:s
endfunction

let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_theme = 'pacmanzou'

set tabline=%!crystalline#bufferline(0,0,1)


" Rainbow:
let g:rainbow_active = 1
let g:rainbow_conf = {'guifgs': ['darkorange', 'darkgray']}


" Illuminate:
let g:Illuminate_highlightUnderCursor = 0
let g:Illuminate_delay = 700


" Indent_blankline:
let g:indent_blankline_char_list = ['|', '¦', '┆', '┊']
let g:indent_blankline_filetype = [
            \ 'go',
            \ 'python',
            \ 'sh',
            \ 'json',
            \ 'markdown',
            \ 'html',
            \ 'javascript',
            \ 'vim',
            \ 'c',
            \ 'cpp'
            \ ]


" Hexokinase:
let g:Hexokinase_highlighters = ['background']


" SmartChr:
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


" Wildfire:
let g:wildfire_objects = {
    \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip", "i>"],
    \ "html,xml" : ["at", "it"],
    \ }

map <c-m> <plug>(wildfire-fuel)


" Abolish:
" nvim built-in
nnoremap <space>s :%s///g<left><left><left>
vnoremap <space>s :s//g<left><left>

" abolish
nnoremap <space>S :%S///g<left><left><left>
vnoremap <space>S :S//g<left><left>


" Visual_multi:
let g:VM_maps = {}
let g:VM_silent_exit = 1
let g:VM_show_warnings = 0
let g:VM_Cursor_hl = 'Visual'
let g:VM_Mono_hl = 'IncSearch'
let g:VM_Extend_hl = 'IncSearch'
let g:VM_Insert_hl = 'IncSearch'
let g:VM_maps['Find Next'] = 'j'
let g:VM_maps['Find Prev'] = 'k'
let g:VM_maps['Find Under'] = ''
let g:VM_maps['Find Subword Under'] = ''
let g:VM_leader = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_custom_motions  = {'<c-e>': '$', '<c-a>': '^'}

nmap <silent><space>v <plug>(VM-Find-Under)

vmap <silent><space>v <plug>(VM-Find-Subword-Under)


" Closetag:
let g:closetag_filenames = '*.html,*.xml,*.tmpl'


" Codepainter:
vnoremap <silent>p :<c-u>call codepainter#paintText(visualmode())<cr>

nnoremap <silent><space>e :PainterEraseLine<cr>
nnoremap <silent><space>E :PainterEraseAll<cr>


" Neoformat:
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


" Vista:
let g:vista_sidebar_position = 'vertical botright'
let g:vista_sidebar_width = 35
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 0
let g:vista_default_executive = 'coc'

nnoremap <silent>T :Vista!!<cr>


" Floaterm:
let g:neoterm_autoscroll = 1
let g:floaterm_borderchars = ['─', '│', '─', '│', '┌', '┐', '┘', '└']
let g:floaterm_width = 0.99
let g:floaterm_height = 0.99
let g:floaterm_title = ''

autocmd FileType floaterm map <c-p> <nop>
autocmd TermOpen term://* startinsert

nnoremap <silent><c-g>p :FloatermToggle<cr>
nnoremap <silent><c-g><c-p> :FloatermToggle<cr>
nnoremap <silent><c-g>n :FloatermNew<cr>
nnoremap <silent><c-g><c-n> :FloatermNew<cr>
nnoremap <silent><c-g>l :FloatermNew lazygit<cr>
nnoremap <silent><c-g><c-l> :FloatermNew lazygit<cr>
nnoremap <silent><c-g>t :FloatermNew htop<cr>
nnoremap <silent><c-g><c-t> :FloatermNew htop<cr>
nnoremap <silent><c-g>r :FloatermNew ranger<cr>
nnoremap <silent><c-g><c-r> :FloatermNew ranger<cr>
nnoremap <silent><c-g><space> :CocList floaterm<cr>

tnoremap <silent><c-o> <c-\><c-n>
tnoremap <silent><c-g><tab> <cmd>FloatermNext<cr>
tnoremap <silent><c-g><s-tab> <cmd>FloatermNext<cr>
tnoremap <silent><c-g>p <cmd>FloatermToggle<cr>
tnoremap <silent><c-g><c-p> <cmd>FloatermToggle<cr>


" Git:
" Fugitive:
let g:fugitive_no_maps = 1

autocmd FileType fugitive,fugitiveblame,git nnoremap <buffer><silent>q :q<cr>


" Gv:
function! s:gv_expand()
    let line = getline('.')
    GV --name-status
    call search('\V'.line, 'c')
    normal! zz
endfunction

autocmd! FileType GV nnoremap <buffer><silent> + :call <sid>gv_expand()<cr>


" Gitgutter:
set foldtext=gitgutter#fold#foldtext()

let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_linenrs = 1
let g:gitgutter_preview_win_floating = 1

nmap <leader>a <Plug>(GitGutterStageHunk)
nmap <leader>u <Plug>(GitGutterUndoHunk)
nmap <leader>p <Plug>(GitGutterPreviewHunk)
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)


" AsyncrunAndAsyncTask:
" tab run
let g:asyncrun_status = ''
let g:asyncrun_open = 9
let g:asynctasks_term_pos = 'TAB'
let g:asynctasks_term_reuse = 1
let g:asyncrun_rootmarks = [
            \ '.git',
            \ '.svn',
            \ '.root',
            \ '.project',
            \ '.hg',
            \ '.idea',
            \ '.gitignore',
            \ 'Makefile',
            \ 'CMakeLists.txt',
            \ '*.pro',
            \ '.tasks'
            \ ]

nnoremap <silent><space>r :AsyncTask run<cr>
nnoremap <space>R :AsyncTask<space>


" Coc:
let g:coc_global_extensions = [
            \ 'coc-go',
            \ 'coc-clangd',
            \ 'coc-pyright',
            \ 'coc-json',
            \ 'coc-sh',
            \ 'coc-tsserver',
            \ 'coc-html',
            \ 'coc-css',
            \ 'coc-vetur',
            \ 'coc-yaml',
            \ 'coc-docker',
            \ 'coc-markdownlint',
            \ 'coc-vimlsp',
            \ 'coc-snippets',
            \ 'coc-just-complete',
            \ 'coc-diagnostic',
            \ 'coc-gitignore',
            \ 'coc-floaterm',
            \ 'coc-lists',
            \ 'coc-yank',
            \ 'coc-translator',
            \ 'coc-explorer',
            \ 'coc-leetcode'
            \ ]

" coc status
function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    let msgs = []
    if get(info, 'error', 0)
        call add(msgs, 'x' . info['error'])
    else
        call add(msgs,'x0')
    endif
    if get(info, 'warning', 0)
        call add(msgs, '!' . info['warning'])
    else
        call add(msgs,'!0')
    endif
    return join(msgs,'')
endfunction

function! CurrentFunction() abort
    let status = get(b:, 'coc_current_function', '')
    return  status
endfunction

" show documentation
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

autocmd FileType help nnoremap <silent><buffer> q :q<cr>

nnoremap <silent>gh :call <sid>show_documentation()<cr>

" snippets
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'

imap <silent><nowait><expr> <C-l> coc#float#has_float() ? "\<c-y>" : "\<plug>(coc-snippets-expand)"

" explorer
nmap <silent>t :CocCommand explorer --sources=file+<cr>

" translate
nmap <silent><space>t <Plug>(coc-translator-e)

" rename
nmap <silent>cn <plug>(coc-rename)

" refactor
nmap <silent>cr <plug>(coc-refactor)

" apply codeAction
vmap <silent><c-f> <plug>(coc-codeaction-selected)

" go to code navigation
nmap <silent>gd <plug>(coc-definition)
nmap <silent>gr <plug>(coc-references)
nmap <silent>gt <plug>(coc-type-definition)
nmap <silent>gi <plug>(coc-implementation)

" diagnostic jump
nmap <silent>]d <plug>(coc-diagnostic-next)
nmap <silent>[d <plug>(coc-diagnostic-prev)

" float window scroll
nnoremap <silent><nowait><expr><c-f> coc#float#scroll(1)
nnoremap <silent><nowait><expr><c-b> coc#float#scroll(0)

" function and class
xmap <silent>if <plug>(coc-funcobj-i)
xmap <silent>af <plug>(coc-funcobj-a)
xmap <silent>ic <plug>(coc-classobj-i)
xmap <silent>ac <plug>(coc-classobj-a)

omap <silent>if <plug>(coc-funcobj-i)
omap <silent>af <plug>(coc-funcobj-a)
omap <silent>ic <plug>(coc-classobj-i)
omap <silent>ac <plug>(coc-classobj-a)

" coclist and coccommand
nnoremap <silent><space>l :CocList<cr>
nnoremap <silent><space>d :CocList diagnostics<cr>
nnoremap <silent><space>y :CocList yank<cr>
nnoremap <silent><space>f :CocList --regex files<cr>
nnoremap <silent><space>b :CocList buffers<cr>
nnoremap <silent><space>w :CocList lines<cr>
nnoremap <silent><space>g :CocList grep<cr>
nnoremap <silent><space>m :CocList marks<cr>
nnoremap <silent><space>h :CocList --regex mru -A<cr>

nnoremap <silent><space>c :CocCommand<cr>
nnoremap <silent><space>i :CocCommand editor.action.organizeImport<cr>

" autocmd for go
autocmd BufWritePre *.go silent call CocAction('runCommand', 'editor.action.organizeImport')


" Languages:
" Go:
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 0


" Javascript:
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1


" Markdown:
" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 0

" markdown toc
let g:vmt_list_item_char = '-'

" markdown-preview
let g:mkdp_browser = 'google-chrome-stable'
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_worl = 0
let g:mkdp_open_ip = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
            \ 'mkit': {},
            \ 'katex': {},
            \ 'uml': {},
            \ 'maid': {},
            \ 'disable_sync_scroll': 0,
            \ 'sync_scroll_type': 'middle',
            \ 'hide_yaml_meta': 1,
            \ 'sequence_diagrams': {},
            \ 'flowchart_diagrams': {},
            \ 'content_editable': v:false,
            \ 'disable_filename': 0
            \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '${name}'
