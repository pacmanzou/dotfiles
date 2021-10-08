set foldtext=gitgutter#fold#foldtext()

let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_linenrs = 1
let g:gitgutter_preview_win_floating = 1

nmap <leader>a <plug>(GitGutterStageHunk)
nmap <leader>u <plug>(GitGutterUndoHunk)
nmap <leader>p <plug>(GitGutterPreviewHunk)
nmap ]h <plug>(GitGutterNextHunk)
nmap [h <plug>(GitGutterPrevHunk)
