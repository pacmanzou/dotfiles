" Plug:
let g:plug_window = '-tabnew'


" Crystalline:
function! StatusLine(current, width)
    let l:s = ''
    if a:current
        let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
    else
        let l:s .= '%#CrystallineInactive#'
    endif
        let l:s .= crystalline#right_sep('', 'Fill')
    if a:current
        let l:s .= '%{&hlsearch?"HLSEARCH ":""}%{&spell?"SPELL ":""}%{CapsLockStatusline()} [%{CurrentFunction()}]%h%w%m%r  %{StatusDiagnostic()}'
    endif
    let l:s .= '%='
    if a:current
        let l:s .= crystalline#left_sep('', 'Fill')
        let l:s .= crystalline#left_mode_sep('')
    endif
    if a:width > 40
        let l:s .= '%{GitstatusB()} %{GitstatusG()}  [%{&ft}|%{&fenc!=#""?&fenc:&enc}|%{&ff}] '
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

nnoremap <silent><space>e <cmd>PainterEraseLine<cr>
nnoremap <silent><space>E <cmd>PainterEraseAll<cr>


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

nnoremap <silent><c-g>n <cmd>Neoformat<cr>
nnoremap <silent><c-g><c-n> <cmd>Neoformat<cr>


" Rnvimr:
let g:rnvimr_presets = [{'width': 0.99, 'height': 0.93}]
let g:rnvimr_enable_ex = 1
let g:rnvimr_enable_bw = 1
let g:rnvimr_draw_border = 1
let g:rnvimr_border_attr = {'fg': -1, 'bg': -1}
let g:rnvimr_vanilla = 0
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-s>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'ew': 'EmitRangerCwd'
            \ }

tnoremap <silent><c-g>r <c-\><c-n><cmd>RnvimrToggle<cr>
tnoremap <silent><c-g><c-r> <c-\><c-n><cmd>RnvimrToggle<cr>

nnoremap <silent><c-g>r <cmd>RnvimrToggle<cr>
nnoremap <silent><c-g><c-r> <cmd>RnvimrToggle<cr>


" Vista:
let g:vista_sidebar_position = 'vertical botright'
let g:vista_sidebar_width = 35
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 0
let g:vista_default_executive = 'coc'

nnoremap <silent>T <cmd>Vista!!<cr>


" Floaterm:
let g:neoterm_autoscroll = 1
let g:floaterm_borderchars = ['─', '│', '─', '│', '┌', '┐', '┘', '└']
let g:floaterm_width = 0.99
let g:floaterm_height = 0.99
let g:floaterm_position = "top"

tnoremap <silent><c-o> <c-\><c-n>
tnoremap <silent><c-g><cr> <cmd>FloatermToggle<cr>

nnoremap <silent><c-g><cr> <cmd>FloatermToggle<cr>

autocmd TermOpen term://* startinsert


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

nnoremap <silent><space>r <cmd>AsyncTask run<cr>
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
            \ 'coc-lists',
            \ 'coc-git',
            \ 'coc-yank',
            \ 'coc-translator',
            \ 'coc-explorer',
            \ 'coc-leetcode'
            \ ]

" coc status
function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    let msgs = []
    if get(info, 'error', 0)
        call add(msgs, 'e' . info['error'])
    endif
    if get(info, 'warning', 0)
        call add(msgs, 'w' . info['warning'])
    endif
    return join(msgs)
endfunction

function! GitstatusG() abort
    let status = get(g:, 'coc_git_status', '')
    return  status
endfunction

function! GitstatusB() abort
    let status = get(b:, 'coc_git_status', '')
    return  status
endfunction

function! CurrentFunction() abort
    let status = get(b:, 'coc_current_function', '')
    return  status
endfunction

" show documentation
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
        nnoremap <silent><buffer> q <cmd>q<cr>
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

nnoremap <silent>gh <cmd>call <sid>show_documentation()<cr>

" snippets
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'

imap <silent><nowait><expr> <C-l> coc#float#has_float() ? "\<c-y>" : "\<plug>(coc-snippets-expand)"

" explorer
nmap <silent>t <cmd>CocCommand explorer --sources=file+<cr>

" translate
nmap <silent><space>t <Plug>(coc-translator-e)

" float jump
nmap <silent><c-o> <plug>(coc-float-jump)

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

" git chunk jump
nmap <silent><leader>j <plug>(coc-git-nextchunk)
nmap <silent><leader>k <plug>(coc-git-prevchunk)

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
nnoremap <silent><space>l <cmd>CocList<cr>
nnoremap <silent><space>d <cmd>CocList diagnostics<cr>
nnoremap <silent><space>y <cmd>CocList yank<cr>
nnoremap <silent><space>f <cmd>CocList --regex files<cr>
nnoremap <silent><space>b <cmd>CocList buffers<cr>
nnoremap <silent><space>w <cmd>CocList lines<cr>
nnoremap <silent><space>g <cmd>CocList grep<cr>
nnoremap <silent><space>m <cmd>CocList marks<cr>
nnoremap <silent><space>h <cmd>CocList --regex mru -A<cr>

nnoremap <silent><space>c <cmd>CocCommand<cr>
nnoremap <silent><space>i <cmd>CocCommand editor.action.organizeImport<cr>

" git
nnoremap <silent><leader>a <cmd>CocCommand git.chunkStage<cr>
nnoremap <silent><leader>u <cmd>CocCommand git.chunkUndo<cr>
nnoremap <silent><leader>p <cmd>CocCommand git.chunkInfo<cr>
nnoremap <silent><leader>y <cmd>CocCommand git.copyUrl<cr>
nnoremap <silent><leader>s <cmd>CocCommand git.showCommit<cr>
nnoremap <silent><leader>f <cmd>CocCommand git.foldUnchanged<cr>
nnoremap <silent><leader>b <cmd>CocCommand git.browserOpen<cr>
nnoremap <silent><leader>c <cmd>CocList bcommits<cr>
nnoremap <silent><leader>C <cmd>CocList commits<cr>

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
