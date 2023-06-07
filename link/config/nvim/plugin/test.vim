" Write some simple test code
if empty(glob('$HOME/.local/share/nvimtest'))
  silent !mkdir -p "$HOME/.local/share/nvimtest"
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
  execute "new " . "$HOME/.local/share/nvimtest/test." . s:fileType
endfunction

nnoremap <silent> <Space>t :call <SID>Test()<CR>

function! s:ClearTests() abort
  silent! execute "!d " . "$HOME/.local/share/nvimtest/test.*"
endfunction

command -bang ClearTests call s:ClearTests()
