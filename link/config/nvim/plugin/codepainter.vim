" Paint selected code
" ---
"
" Commands:
" - PainterEraseAll, PainterEraseLine

if exists("g:loaded_painter")
    finish
endif
let g:loaded_painter = 1

let s:cpo_save = &cpo
set cpo&vim

" defining the colors
hi paint guifg=NONE guibg=NONE gui=reverse cterm=reverse

let g:paint_name = "paint"
let g:marks = {}

func! s:AuxMark(start_pos, end_pos) abort
    let l:mark = 0
    if has('nvim')
        let l:mark = nvim_buf_add_highlight(0, 0, g:paint_name, a:start_pos[1] - 1, a:start_pos[2] - 1, a:end_pos[2])
    else
        call prop_type_add(g:vim_index, {'highlight': g:paint_name })
        call prop_add( a:start_pos[1], a:start_pos[2], {'length' : a:end_pos[2] == -1 ? "99999" : a:end_pos[2] - a:start_pos[2] + 1 , 'type': g:vim_index})
    let l:mark = g:vim_index
    let g:vim_index += 1
    endif
    if !has_key(g:marks, a:start_pos[1])
        let g:marks[a:start_pos[1]] = []
    endif
    let g:marks[a:start_pos[1]] = add(g:marks[a:start_pos[1]], [copy(a:start_pos), copy(a:end_pos), l:mark, g:paint_name])
endfunc

func! s:AuxUnmark(line, id)
    if has('nvim')
        call nvim_buf_clear_namespace(0, a:id, a:line - 1,-1)
    else
        call prop_remove({'type': a:id}, a:line)
        call prop_type_delete(a:id)
    endif
    let idx = 0
    while idx < len(g:marks[a:line])
        let l:mark = g:marks[a:line][idx]
        if l:mark[2] == a:id
            call remove(g:marks[a:line], idx)
            break
        endif
        let idx += 1
    endwhile
    if empty(g:marks[a:line])
        unlet g:marks[a:line]
    endif
endfunc

func! s:MultiLineMark(start_pos, end_pos, delta_pos, aux_col) abort
    let aux_start_pos = copy(a:start_pos)
    let aux_end_pos = copy(a:start_pos)
    let aux_end_pos[2] = a:end_pos[2]
    let line = 0
    while line < a:delta_pos
        let end_col = col([aux_start_pos[1], "$"])
        let aux_end_pos[2] = min([a:aux_col, end_col])
        call s:AuxMark(aux_start_pos, aux_end_pos)
        let aux_start_pos[1] += 1
        let aux_end_pos[1] += 1
        let line += 1
    endwhile
    let end_col = col([aux_start_pos[1], "$"])
    let aux_end_pos[2] = min([a:aux_col, end_col])
    call s:AuxMark(aux_start_pos, aux_end_pos)
endfunc

func! s:MarkSelection(start_pos, end_pos, v_mode) abort
    let l:delta_pos = a:end_pos[1] - a:start_pos[1]
    if l:delta_pos == 0 "on the same line
        call s:MultiLineMark(a:start_pos,a:end_pos, l:delta_pos, a:end_pos[2])
    else "more than 1 line
        if a:v_mode == 'v' "visual mode
            call s:MultiLineMark(a:start_pos, a:end_pos, l:delta_pos, 2147483647)
        else "block visual mode
            call s:MultiLineMark(a:start_pos, a:end_pos, l:delta_pos, a:end_pos[2])
        endif
    endif
endfunc

func! codepainter#paintText(v_mode) range abort
    "mark text
    let l:start_pos = getpos("'<")
    let l:end_pos = getpos("'>")
    "neovim doesn't clean the position of < and > (selections), so
    "the only way of knowing if we are indeed painting is if the
    "cursor is inside that range
    if l:start_pos[1] != getpos(".")[1]
        return
    endif
    if l:start_pos == [0,0,0,0] && l:end_pos == [0,0,0,0]
        return
    endif
    "if last character is \n, subtract 1 from column (to avoid problems)
    if getline("'>")[col("'>") - 1] == "0x0a"
        let l:end_pos[2] -= 1
    endif
    let index = 0
    let l:found = 0
    let l:remarked = 0
    let lines = l:end_pos[1] - l:start_pos[1]
    while !l:remarked && l:found != (lines+1) && index <= lines
        "if it wasn't stored, we mark it
        if !has_key(g:marks, l:start_pos[1] + index)
            call s:MarkSelection(l:start_pos, l:end_pos, a:v_mode)
            return
        endif
        for known_mark in g:marks[l:start_pos[1] + index]
            let l:col_deltas = [l:start_pos[2]  - known_mark[0][2], l:end_pos[2] - known_mark[1][2]]
            if l:col_deltas == [0, 0] || l:col_deltas == [0, -2147483646]
                let l:found += 1
                call s:AuxUnmark(l:start_pos[1] + index, known_mark[2])
                if known_mark[3] != g:paint_name
                    call s:MarkSelection(l:start_pos, l:end_pos, a:v_mode)
                    let l:remarked = 1
                    break
                endif
            endif
        endfor
        let index += 1
    endwhile
    if l:found == 0
        call s:MarkSelection(l:start_pos, l:end_pos, a:v_mode)
    endif
endfunc

func! codepainter#EraseAll() abort
    "loop through the dictionary and delete each one in the array, if the array is
    "empty, remove from the dictionary
    let nvim_flag = has('nvim')
    for line in keys(g:marks)
        for l:mark in g:marks[line]
            if nvim_flag
                silent! call nvim_buf_clear_namespace(0, l:mark[2], 0, -1)
            else
                silent! call prop_remove({'type': l:mark[2]}, l:mark[1][1])
                silent! call prop_type_delete(l:mark[2])
            endif
        endfor
    endfor
    let g:marks = {}
endfunc

func! codepainter#EraseLine(...) abort
    let l:line = a:0 == 0 ? getpos(".")[1] : a:1
    let nvim_flag = has('nvim')
    for l:mark in g:marks[l:line]
        if nvim_flag
            silent! call nvim_buf_clear_namespace(0, l:mark[2], 0, -1)
        else
            silent! call prop_remove({'type': l:mark[2]}, l:mark[1][1])
            silent! call prop_type_delete(l:mark[2])
        endif
    endfor
    unlet g:marks[l:line]
endfunc

command! -nargs=0 PainterEraseAll           silent! call codepainter#EraseAll()
command! -nargs=? PainterEraseLine          silent! call codepainter#EraseLine(<f-args>)

vnoremap <silent> p :<c-u>call codepainter#paintText(visualmode())<cr>

let &cpo = s:cpo_save
unlet! s:cpo_save
