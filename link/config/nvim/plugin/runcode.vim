" Run the code
function! s:RunCode() abort
  silent! exec "w"
  if &filetype == 'go'
    :sp
    :res 10
    :term go run %
  elseif &filetype == 'c'
		:sp
		:res -10
		:term gcc % -o %< && time ./%<
	elseif &filetype == 'cpp'
		silent! exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -10
		:term ./%<
  elseif &filetype == 'python'
    :sp
    :res 10
    :term python3 %
  elseif &filetype == 'sh'
    :sp
    :res 10
    :term bash %
  elseif &filetype == 'javascript'
    :sp
    :res 10
    :term node %
  elseif &filetype == 'html'
    silent! exec "!xdg-open %"
  elseif &filetype == 'markdown'
    silent! exec "MarkdownPreview"
  else
    echohl WarningMsg
    echo "Current filetype is not supported"
    echohl None
  endif
endfunction

nnoremap <silent> <space>r :call <sid>RunCode()<cr>
