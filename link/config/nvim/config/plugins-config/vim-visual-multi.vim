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
