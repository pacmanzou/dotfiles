" Write some simple test code

if empty(glob('$HOME/.cache/nvim/test'))
  silent !mkdir -p "$HOME/.cache/nvim/test"
endif

function! s:Input() abort
  call inputsave()
  let val = input('Test FileType: ')
  call inputrestore()
  return val
endfunction

function! s:Test() abort
  let s:fileType = s:Input()
  if empty(s:fileType)
    return
  endif
  execute "new " . "$HOME/.cache/nvim/test/test." . s:fileType
endfunction

nnoremap <silent> <space>t :call <sid>Test()<cr>

function! s:ClearTests() abort
  silent! execute "!d " . "$HOME/.cache/nvim/test/test.*"
endfunction

command -bang ClearTests call s:ClearTests()
