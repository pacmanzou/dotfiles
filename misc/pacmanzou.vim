function! crystalline#theme#pacmanzou#set_theme() abort
    call crystalline#generate_theme({
          \ 'NormalMode':  [[246, 239], ['#ebdbb2', '#000000']],
          \ 'VisualMode':  [[246, 239], ['#ebdbb2', '#000000']],
          \ 'InsertMode':  [[246, 239], ['#ebdbb2', '#000000']],
          \ 'ReplaceMode': [[246, 239], ['#ebdbb2', '#000000']],
          \ '':            [[246, 239], ['#ebdbb2', '#000000']],
          \ 'Inactive':    [[246, 239], ['#ebdbb2', '#000000']],
          \ 'Fill':        [[246, 239], ['#ebdbb2', '#000000']],
          \ 'Tab':         [[246, 239], ['#353535', '#000000']],
          \ 'TabType':     [[246, 239], ['#ebdbb2', '#000000']],
          \ 'TabSel':      [[235, 246], ['#353535', '#000000']],
          \ 'TabFill':     [[235, 235], ['#00000000', '#00000000']],
          \ })
endfunction

" vim:set et sw=2 ts=2 fdm=marker:
