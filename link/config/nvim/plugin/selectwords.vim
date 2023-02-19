" Highlight the under cursor word
let s:selectWordsColors = ['#b8bb26', '#8ec07c', '#fb4934']

let s:hasBuiltColors = 0

let s:selectWords = []
let s:selectModes = []
let s:mids = {}
let s:recentlyUsed = []

function! ColorWord(word, mode)
  if !(s:hasBuiltColors)
    call s:buildColors()
  endif

  " gets the lowest unused index
  let n = index(s:selectWords, 0)
  if (n == -1)
    if !(exists('g:selectWordsCycleColors') && g:selectWordsCycleColors)
      echohl WarningMsg
      echom "Max number of highlight groups reached " . len(s:selectWords)
      echohl None
      return
    else
      let n = s:recentlyUsed[0]
      call UncolorWord(s:selectWords[n])
    endif
  endif

  let mid = 595129 + n
  let s:selectWords[n] = a:word
  let s:selectModes[n] = a:mode
  let s:mids[a:word] = mid

  call s:apply_color_to_word(n, a:word, a:mode, mid)

  call s:markRecentlyUsed(n)

endfunction

function! s:apply_color_to_word(n, word, mode, mid)
  let case = s:checkIgnoreCase(a:word) ? '\c' : '\C'
  if a:mode == 'v'
    let pat = case . '\V\zs' . escape(a:word, '\') . '\ze'
  else
    let pat = case . '\V\<' . escape(a:word, '\') . '\>'
  endif

  try
    call matchadd("SelectWord" . (a:n + 1), pat, 1, a:mid)
  catch /E801/      " match id already taken.
  endtry
endfunction

function! s:nearest_group_at_cursor() abort
  let l:matches = {}
  for l:match_item in getmatches()
    let l:mids = filter(items(s:mids), 'v:val[1] == l:match_item.id')
    if len(l:mids) == 0
      continue
    endif
    let l:word = l:mids[0][0]
    let l:position = match(getline('.'), l:match_item.pattern)
    if l:position > -1
      if col('.') > l:position && col('.') <= l:position + len(l:word)
        return l:word
      endif
    endif
  endfor
  return ''
endfunction

function! UncolorWord(word)
  let index = index(s:selectWords, a:word)

  if (index > -1)
    let mid = s:mids[a:word]

    silent! call matchdelete(mid)
    let s:selectWords[index] = 0
    unlet s:mids[a:word]
  endif
endfunction

function! s:getmatch(mid) abort
  return filter(getmatches(), 'v:val.id==a:mid')[0]
endfunction

function! SelectWords(mode) range
  if a:mode == 'v'
    let currentWord = s:get_visual_selection()
  else
    let currentWord = expand('<cword>') . ''
  endif
  if !(len(currentWord))
    return
  endif
  if (s:checkIgnoreCase(currentWord))
    let currentWord = tolower(currentWord)
  endif
  if (index(s:selectWords, currentWord) == -1)
    call ColorWord(currentWord, a:mode)
  else
    call UncolorWord(currentWord)
  endif
endfunction

function! s:get_visual_selection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

function! UncolorAllWords()
  for word in s:selectWords
    " check that word is actually a String since '0' is falsy
    if (type(word) == 1)
      call UncolorWord(word)
    endif
  endfor
endfunction

" returns true if the ignorecase flag needs to be used
function! s:checkIgnoreCase(word)
  " return false if case sensitive is used
  if (exists('g:selectWordsCaseSensitive'))
    return !g:selectWordsCaseSensitive
  endif
  " checks ignorecase
  " and then if smartcase is on, check if the word contains an uppercase char
  return &ignorecase && (!&smartcase || (match(a:word, '\u') == -1))
endfunction

" moves the index to the back of the s:recentlyUsed list
function! s:markRecentlyUsed(n)
  let index = index(s:recentlyUsed, a:n)
  call remove(s:recentlyUsed, index)
  call add(s:recentlyUsed, a:n)
endfunction

function! s:uiMode()
  " Stolen from airline's airline#init#gui_mode()
  return ((has('nvim') && exists('$NVIM_TUI_ENABLE_TRUE_COLOR') && !exists("+termguicolors"))
     \ || has('gui_running') || (has("termtruecolor") && &guicolors == 1) || (has("termguicolors") && &termguicolors == 1)) ?
      \ 'gui' : 'cterm'
endfunction

" initialise highlight colors from list of GUIColors
function! s:buildColors()
  if (s:hasBuiltColors)
    return
  endif
  let ui = s:uiMode()
  let wordColors = s:selectWordsColors
  " select ui type
  " highlight group indexed from 1
  let currentIndex = 1
  for wordColor in wordColors
    execute 'hi! def SelectWord' . currentIndex . ' ' . ui . 'bg=' . wordColor . ' ' . ui . 'fg=Black'
    call add(s:selectWords, 0)
    call add(s:selectModes, 'n')
    call add(s:recentlyUsed, currentIndex-1)
    let currentIndex += 1
  endfor
  let s:hasBuiltColors = 1
endfunc

nnoremap <silent> <c-s> :call SelectWords('n')<cr>
vnoremap <silent> <c-s> :call SelectWords('v')<cr>

nnoremap <silent> <esc> :call UncolorAllWords()<cr>
