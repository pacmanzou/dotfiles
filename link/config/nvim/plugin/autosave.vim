" Auto save when exit the insert mode
" ---
"
" Commands:
" - AutoSave

if exists('g:loaded_autosave')
	finish
endif
let g:loaded_autosave = 1

function! s:autosave(enable) abort
  augroup autosave
    autocmd!
    if a:enable
      autocmd TextChanged,InsertLeave <buffer>
            \  if empty(&buftype) && !empty(bufname(''))
            \|   silent! update
            \| endif
    endif
  augroup END
endfunction

command! -bang AutoSave call s:autosave(<bang>1)
