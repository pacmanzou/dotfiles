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

nnoremap <silent> <space>r :call RunCode()<cr>
