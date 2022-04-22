" Change indent quickily

function s:Indent2To4() abort
  set noexpandtab
  :%retab!
  set tabstop=4
  set shiftwidth=4
  set expandtab
  :%retab!
endfunction

function s:Indent4To2() abort
  set noexpandtab
  :%retab!
  set tabstop=2
  set shiftwidth=2
  set expandtab
  :%retab!
endfunction

command -bang ChangeIndent2To4 call s:Indent2To4()
command -bang ChangeIndent4To2 call s:Indent4To2()
