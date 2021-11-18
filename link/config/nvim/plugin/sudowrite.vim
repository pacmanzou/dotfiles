" Save as root
" ---
"
" Commands:
" - SudoWrite

if exists('g:loaded_sudowrite')
    finish
endif
let g:loaded_sudowrite = 1

command! SudoWrite w !sudo tee > /dev/null %
