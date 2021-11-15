" Run the code

function! RunCode()
	silent! exec "w"
	if &filetype == 'go'
		:sp
		:res -11
		:term go run %
	elseif &filetype == 'python'
		:sp
		:res -11
		:term python3 %
	elseif &filetype == 'sh'
		:sp
		:res -11
		:term bash %
	elseif &filetype == 'javascript'
		:sp
		:res -11
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'html'
        silent! exec "!xdg-open %"
	elseif &filetype == 'markdown'
		silent! exec "MarkdownPreview"
	endif
endfunction

nnoremap <silent><space>r :call RunCode()<cr>
