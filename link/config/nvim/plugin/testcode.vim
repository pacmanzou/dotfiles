" Test the code
if empty(glob("$HOME/Test/nvim"))
  silent !mkdir -p "$HOME/Test/nvim"
endif

function! s:Input() abort
  call inputsave()
  let val = input("Test FileType: ")
  call inputrestore()
  return val
endfunction

function! s:Test() abort
  let s:fileType = s:Input()
  if empty(s:fileType)
    return
  endif
  execute "new " . "$HOME/Test/nvim/test." . s:fileType
endfunction

nnoremap <silent> <Space>t :call <SID>Test()<CR>

function! s:ClearTests() abort
  silent! execute "!d " . "$HOME/Test/nvim/test.*"
endfunction

command -bang ClearTests call s:ClearTests()
