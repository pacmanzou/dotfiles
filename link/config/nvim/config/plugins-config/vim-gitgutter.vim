set foldtext=gitgutter#fold#foldtext()

let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_linenrs = 1
let g:gitgutter_preview_win_floating = 1

nmap <leader>a <Plug>(GitGutterStageHunk)
nmap <leader>u <Plug>(GitGutterUndoHunk)
nmap <leader>p <Plug>(GitGutterPreviewHunk)
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
