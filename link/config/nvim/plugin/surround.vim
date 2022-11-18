" Surround

if exists("g:loaded_surround") || &cp || v:version < 700
  finish
endif
let g:loaded_surround = 1

" Input functions {{{1

function! s:getchar()
  let c = getchar()
  if c =~ '^\d\+$'
    let c = nr2char(c)
  endif
  return c
endfunction

function! s:inputtarget()
  let c = s:getchar()
  while c =~ '^\d\+$'
    let c .= s:getchar()
  endwhile
  if c == " "
    let c .= s:getchar()
  endif
  if c =~ "\<Esc>\|\<C-C>\|\0"
    return ""
  else
    return c
  endif
endfunction

function! s:inputreplacement()
  let c = s:getchar()
  if c == " "
    let c .= s:getchar()
  endif
  if c =~ "\<Esc>" || c =~ "\<C-C>"
    return ""
  else
    return c
  endif
endfunction

function! s:beep()
  exe "norm! \<Esc>"
  return ""
endfunction

function! s:redraw()
  redraw
  return ""
endfunction

" }}}1

" Wrapping functions {{{1

function! s:extractbefore(str)
  if a:str =~ '\r'
    return matchstr(a:str,'.*\ze\r')
  else
    return matchstr(a:str,'.*\ze\n')
  endif
endfunction

function! s:extractafter(str)
  if a:str =~ '\r'
    return matchstr(a:str,'\r\zs.*')
  else
    return matchstr(a:str,'\n\zs.*')
  endif
endfunction

function! s:fixindent(str,spc)
  let str = substitute(a:str,'\t',repeat(' ',&sw),'g')
  let spc = substitute(a:spc,'\t',repeat(' ',&sw),'g')
  let str = substitute(str,'\(\n\|\%^\).\@=','\1'.spc,'g')
  if ! &et
    let str = substitute(str,'\s\{'.&ts.'\}',"\t",'g')
  endif
  return str
endfunction

function! s:process(string)
  let i = 0
  for i in range(7)
    let repl_{i} = ''
    let m = matchstr(a:string,nr2char(i).'.\{-\}\ze'.nr2char(i))
    if m != ''
      let m = substitute(strpart(m,1),'\r.*','','')
      let repl_{i} = input(match(m,'\w\+$') >= 0 ? m.': ' : m)
    endif
  endfor
  let s = ""
  let i = 0
  while i < strlen(a:string)
    let char = strpart(a:string,i,1)
    if char2nr(char) < 8
      let next = stridx(a:string,char,i+1)
      if next == -1
        let s .= char
      else
        let insertion = repl_{char2nr(char)}
        let subs = strpart(a:string,i+1,next-i-1)
        let subs = matchstr(subs,'\r.*')
        while subs =~ '^\r.*\r'
          let sub = matchstr(subs,"^\r\\zs[^\r]*\r[^\r]*")
          let subs = strpart(subs,strlen(sub)+1)
          let r = stridx(sub,"\r")
          let insertion = substitute(insertion,strpart(sub,0,r),strpart(sub,r+1),'')
        endwhile
        let s .= insertion
        let i = next
      endif
    else
      let s .= char
    endif
    let i += 1
  endwhile
  return s
endfunction

function! s:wrap(string,char,type,removed,special)
  let keeper = a:string
  let newchar = a:char
  let s:input = ""
  let type = a:type
  let linemode = type ==# 'V' ? 1 : 0
  let before = ""
  let after  = ""
  if type ==# "V"
    let initspaces = matchstr(keeper,'\%^\s*')
  else
    let initspaces = matchstr(getline('.'),'\%^\s*')
  endif
  let pairs = "((){{}[[]<<>"
  let extraspace = ""
  let idx = stridx(pairs,newchar)
  if newchar == ' '
    let before = ''
    let after  = ''
  elseif exists("b:surround_".char2nr(newchar))
    let all    = s:process(b:surround_{char2nr(newchar)})
    let before = s:extractbefore(all)
    let after  =  s:extractafter(all)
  elseif exists("g:surround_".char2nr(newchar))
    let all    = s:process(g:surround_{char2nr(newchar)})
    let before = s:extractbefore(all)
    let after  =  s:extractafter(all)
  elseif newchar ==# "p"
    let before = "\n"
    let after  = "\n\n"
  elseif newchar =~# "[t\<C-T>]"
    let dounmapp = 0
    let dounmapb = 0
    if !maparg(">","c")
      let dounmapb = 1
      " Hide from AsNeeded
      exe "cn"."oremap > ><CR>"
    endif
    let default = ""
    if newchar ==# "t"
      if !exists("s:lastdel")
        let s:lastdel = ""
      endif
      let default = matchstr(s:lastdel,'<\zs.\{-\}\ze>')
    endif
    let tag = input("<",default)
    if dounmapb
      silent! cunmap >
    endif
    let s:input = tag
    if tag != ""
      let keepAttributes = ( match(tag, ">$") == -1 )
      let tag = substitute(tag,'>*$','','')
      let attributes = ""
      if keepAttributes
        let attributes = matchstr(a:removed, '<[^ \t\n]\+\zs\_.\{-\}\ze>')
      endif
      let s:input = tag . '>'
      if tag =~ '/$'
        let tag = substitute(tag, '/$', '', '')
        let before = '<'.tag.attributes.' />'
        let after = ''
      else
        let before = '<'.tag.attributes.'>'
        let after  = '</'.substitute(tag,' .*','','').'>'
      endif
      if newchar == "\<C-T>"
        if type ==# "v" || type ==# "V"
          let before .= "\n\t"
        endif
        if type ==# "v"
          let after  = "\n". after
        endif
      endif
    endif
  elseif newchar ==# 'f'
    let fnc = input("function: ")
    if fnc != ""
      let s:input = fnc."\<CR>"
      let before = substitute(fnc,'($','','').'('
      let after  = ')'
    endif
  elseif newchar ==# "\<C-F>"
    if &filetype == "python"
      let fnc = input("def: ")
      let s:input = fnc."\<CR>"
      let before = "def ".fnc."():"."\n\t"
      let after = ""
    elseif &filetype == "go"
      let fnc = input("func: ")
      let s:input = fnc."\<CR>"
      let before = "func ".fnc."() {"."\n\t"
      let after = "\n"."}"
    else
      let fnc = input('function: ')
      if fnc != ""
        let s:input = fnc."\<CR>"
        let before = fnc.' {'."\n\t"
        let after = "\n".'}'
      endif
    endif
  elseif idx >= 0
    let spc = (idx % 3) == 1 ? " " : ""
    let idx = idx / 3 * 3
    let before = strpart(pairs,idx+1,1) . spc
    let after  = spc . strpart(pairs,idx+2,1)
  elseif newchar !~ '\a'
    let before = newchar
    let after  = newchar
  else
    let before = ''
    let after  = ''
  endif
  let after  = substitute(after ,'\n','\n'.initspaces,'g')
  if type ==# 'V' || (a:special && type ==# "v")
    let before = substitute(before,' \+$','','')
    let after  = substitute(after ,'^ \+','','')
    if after !~ '^\n'
      let after  = initspaces.after
    endif
    if keeper !~ '\n$' && after !~ '^\n'
      let keeper .= "\n"
    elseif keeper =~ '\n$' && after =~ '^\n'
      let after = strpart(after,1)
    endif
    if keeper !~ '^\n' && before !~ '\n\s*$'
      let before .= "\n"
      if a:special
        let before .= "\t"
      endif
    elseif keeper =~ '^\n' && before =~ '\n\s*$'
      let keeper = strcharpart(keeper,1)
    endif
    if type ==# 'V' && keeper =~ '\n\s*\n$'
      let keeper = strcharpart(keeper,0,strchars(keeper) - 1)
    endif
  endif
  if type ==# 'V'
    let before = initspaces.before
  endif
  if before =~ '\n\s*\%$'
    if type ==# 'v'
      let keeper = initspaces.keeper
    endif
    let padding = matchstr(before,'\n\zs\s\+\%$')
    let before  = substitute(before,'\n\s\+\%$','\n','')
    let keeper = s:fixindent(keeper,padding)
  endif
  if type ==# 'V'
    let keeper = before.keeper.after
  elseif type =~ "^\<C-V>"
    " Really we should be iterating over the buffer
    let repl = substitute(before,'[\\~]','\\&','g').'\1'.substitute(after,'[\\~]','\\&','g')
    let repl = substitute(repl,'\n',' ','g')
    let keeper = substitute(keeper."\n",'\(.\{-\}\)\(\n\)',repl.'\n','g')
    let keeper = substitute(keeper,'\n\%$','','')
  else
    let keeper = before.extraspace.keeper.extraspace.after
  endif
  return keeper
endfunction

function! s:wrapreg(reg,char,removed,special)
  let orig = getreg(a:reg)
  let type = substitute(getregtype(a:reg),'\d\+$','','')
  let new = s:wrap(orig,a:char,type,a:removed,a:special)
  call setreg(a:reg,new,type)
endfunction
" }}}1

function! s:reindent() " {{{1
  if exists("b:surround_indent") ? b:surround_indent : (!exists("g:surround_indent") || g:surround_indent)
    silent norm! '[=']
  endif
endfunction " }}}1

function! s:dosurround(...) " {{{1
  let scount = v:count1
  let char = (a:0 ? a:1 : s:inputtarget())
  let spc = ""
  if char =~ '^\d\+'
    let scount = scount * matchstr(char,'^\d\+')
    let char = substitute(char,'^\d\+','','')
  endif
  if char == '<'
    let char = '>'
  endif
  if char == '('
    let char = ')'
  endif
  if char == '['
    let char = ']'
  endif
  if char == '{'
    let char = '}'
  endif
  let newchar = ""
  if a:0 > 1
    let newchar = a:2
    if newchar == "\<Esc>" || newchar == "\<C-C>" || newchar == ""
      return s:beep()
    endif
  endif
  let cb_save = &clipboard
  set clipboard-=unnamed clipboard-=unnamedplus
  let append = ""
  let original = getreg('"')
  let otype = getregtype('"')
  call setreg('"',"")
  let strcount = (scount == 1 ? "" : scount)
  if char == '/'
    exe 'norm! '.strcount.'[/d'.strcount.']/'
  elseif char =~# '[[:punct:][:space:]]' && char !~# '[][(){}<>"''`]'
    exe 'norm! T'.char
    if getline('.')[col('.')-1] == char
      exe 'norm! l'
    endif
    exe 'norm! dt'.char
  else
    exe 'norm! d'.strcount.'i'.char
  endif
  let keeper = getreg('"')
  let okeeper = keeper " for reindent below
  if keeper == ""
    call setreg('"',original,otype)
    let &clipboard = cb_save
    return ""
  endif
  let oldline = getline('.')
  let oldlnum = line('.')
  if char ==# "p"
    call setreg('"','','V')
  elseif char ==# "s" || char ==# "w" || char ==# "W"
    " Do nothing
    call setreg('"','')
  elseif char =~ "[\"'`]"
    exe "norm! i \<Esc>d2i".char
    call setreg('"',substitute(getreg('"'),' ','',''))
  elseif char == '/'
    norm! "_x
    call setreg('"','/**/',"c")
    let keeper = substitute(substitute(keeper,'^/\*\s\=','',''),'\s\=\*$','','')
  elseif char =~# '[[:punct:][:space:]]' && char !~# '[][(){}<>]'
    exe 'norm! F'.char
    exe 'norm! df'.char
  else
    " One character backwards
    call search('\m.', 'bW')
    exe "norm! da".char
  endif
  let removed = getreg('"')
  let rem2 = substitute(removed,'\n.*','','')
  let oldhead = strpart(oldline,0,strlen(oldline)-strlen(rem2))
  let oldtail = strpart(oldline,  strlen(oldline)-strlen(rem2))
  let regtype = getregtype('"')
  if char =~# '[\[({]' || spc
    let keeper = substitute(keeper,'^\s\+','','')
    let keeper = substitute(keeper,'\s\+$','','')
  endif
  if col("']") == col("$") && virtcol('.') + 1 == virtcol('$')
    if oldhead =~# '^\s*$' && a:0 < 2
      let keeper = substitute(keeper,'\%^\n'.oldhead.'\(\s*.\{-\}\)\n\s*\%$','\1','')
    endif
    let pcmd = "p"
  else
    let pcmd = "P"
  endif
  if line('.') + 1 < oldlnum && regtype ==# "V"
    let pcmd = "p"
  endif
  call setreg('"',keeper,regtype)
  if newchar != ""
    let special = a:0 > 2 ? a:3 : 0
    call s:wrapreg('"',newchar,removed,special)
  endif
  silent exe 'norm! ""'.pcmd.'`['
  if removed =~ '\n' || okeeper =~ '\n' || getreg('"') =~ '\n'
    call s:reindent()
  endif
  if getline('.') =~ '^\s\+$' && keeper =~ '^\s*\n'
    silent norm! cc
  endif
  call setreg('"',original,otype)
  let s:lastdel = removed
  let &clipboard = cb_save
  if newchar == ""
    silent! call repeat#set("\<Plug>Dsurround".char,scount)
  else
    silent! call repeat#set("\<Plug>C".(a:0 > 2 && a:3 ? "S" : "s")."urround".char.newchar.s:input,scount)
  endif
endfunction " }}}1

function! s:changesurround(...) " {{{1
  let a = s:inputtarget()
  if a == ""
    return s:beep()
  endif
  let b = s:inputreplacement()
  if b == ""
    return s:beep()
  endif
  call s:dosurround(a,b,a:0 && a:1)
endfunction " }}}1

function! s:opfunc(type, ...) abort " {{{1
  if a:type ==# 'setup'
    let &opfunc = matchstr(expand('<sfile>'), '<SNR>\w\+$')
    return 'g@'
  endif
  let char = s:inputreplacement()
  if char == ""
    return s:beep()
  endif
  let reg = '"'
  let sel_save = &selection
  let &selection = "inclusive"
  let cb_save  = &clipboard
  set clipboard-=unnamed clipboard-=unnamedplus
  let reg_save = getreg(reg)
  let reg_type = getregtype(reg)
  let type = a:type
  if a:type == "char"
    silent exe 'norm! v`[o`]"'.reg.'y'
    let type = 'v'
  elseif a:type == "line"
    silent exe 'norm! `[V`]"'.reg.'y'
    let type = 'V'
  elseif a:type ==# "v" || a:type ==# "V" || a:type ==# "\<C-V>"
    let &selection = sel_save
    let ve = &virtualedit
    if !(a:0 && a:1)
      set virtualedit=
    endif
    silent exe 'norm! gv"'.reg.'y'
    let &virtualedit = ve
  elseif a:type =~ '^\d\+$'
    let type = 'v'
    silent exe 'norm! ^v'.a:type.'$h"'.reg.'y'
    if mode() ==# 'v'
      norm! v
      return s:beep()
    endif
  else
    let &selection = sel_save
    let &clipboard = cb_save
    return s:beep()
  endif
  let keeper = getreg(reg)
  if type ==# "v" && a:type !=# "v"
    let append = matchstr(keeper,'\_s\@<!\s*$')
    let keeper = substitute(keeper,'\_s\@<!\s*$','','')
  endif
  call setreg(reg,keeper,type)
  call s:wrapreg(reg,char,"",a:0 && a:1)
  if type ==# "v" && a:type !=# "v" && append != ""
    call setreg(reg,append,"ac")
  endif
  silent exe 'norm! gv'.(reg == '"' ? '' : '"' . reg).'p`['
  if type ==# 'V' || (getreg(reg) =~ '\n' && type ==# 'v')
    call s:reindent()
  endif
  call setreg(reg,reg_save,reg_type)
  let &selection = sel_save
  let &clipboard = cb_save
  if a:type =~ '^\d\+$'
    silent! call repeat#set("\<Plug>Y".(a:0 && a:1 ? "S" : "s")."surround".char.s:input,a:type)
  else
    silent! call repeat#set("\<Plug>SurroundRepeat".char.s:input)
  endif
endfunction " }}}1

nnoremap <silent> <Plug>SurroundRepeat .
nnoremap <silent> <Plug>Dsurround  :<C-U>call <SID>dosurround(<SID>inputtarget())<CR>
nnoremap <silent> <Plug>Csurround  :<C-U>call <SID>changesurround()<CR>
nnoremap <expr>   <Plug>Yssurround '^'.v:count1.<SID>opfunc('setup').'g_'
nnoremap <expr>   <Plug>Ysurround  <SID>opfunc('setup')

vnoremap <silent> <Plug>VSurround  :<C-U>call <SID>opfunc(visualmode(),visualmode() ==# 'V' ? 1 : 0)<CR>

" map
nmap s <Plug>Ysurround
nmap ds <Plug>Dsurround
nmap cs <Plug>Csurround
nmap ss <Plug>Yssurround
nmap S s$

vmap s <Plug>VSurround
vmap S <Plug>VSurround
