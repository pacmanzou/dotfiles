" clear
hi clear

" basics
hi Normal       guifg=#ebdbb2 guibg=#000000 gui=NONE           cterm=NONE
hi Visual       guifg=NONE    guibg=NONE    gui=reverse        cterm=NONE
hi SignColumn   guifg=#ebdbb2 guibg=#000000 gui=NONE           cterm=NONE
hi ColorColumn  guifg=NONE    guibg=#000000 gui=NONE           cterm=NONE
hi VertSplit    guifg=#665c54 guibg=#000000 gui=NONE           cterm=NONE
hi Comment      guifg=#928374 guibg=NONE    gui=italic         cterm=italic
hi CursorLine   guifg=NONE    guibg=#353535 gui=NONE           cterm=NONE
hi CursorLineNr guifg=#ebdbb2 guibg=#000000 gui=NONE           cterm=NONE
hi Error        guifg=#fb4934 guibg=#000000 gui=bold           cterm=bold
hi ErrorMsg     guifg=#fb4934 guibg=#000000 gui=bold           cterm=bold
hi ModeMsg      guifg=#ebdbb2 guibg=NONE    gui=bold           cterm=bold
hi MoreMsg      guifg=#ebdbb2 guibg=NONE    gui=bold           cterm=bold
hi WarningMsg   guifg=#FE8019 guibg=NONE    gui=bold           cterm=bold
hi LineNr       guifg=#7c6f64 guibg=NONE    gui=NONE           cterm=NONE
hi NonText      guifg=#504945 guibg=NONE    gui=NONE           cterm=NONE
hi MatchParen   guifg=NONE    guibg=#665c54 gui=bold,underline cterm=bold,underline
hi SpecialKey   guifg=#928374 guibg=NONE    gui=NONE           cterm=NONE
hi WildMenu     guifg=#ebdbb2 guibg=#1d1d1d gui=bold           cterm=bold
hi Conceal      guifg=#83a598 guibg=NONE    gui=NONE           cterm=NONE
hi Cursor       guifg=NONE    guibg=NONE    gui=reverse        ctermfg=NONE ctermbg=NONE cterm=reverse
hi Directory    guifg=#b8bb26 guibg=NONE    gui=bold           cterm=bold
hi EndOfBuffer  guifg=#000000 guibg=NONE    gui=NONE           cterm=NONE
hi Question     guifg=#fe8019 guibg=NONE    gui=bold           cterm=bold
hi Title        guifg=#ebdbb2 guibg=NONE    gui=bold           cterm=bold

" search
hi IncSearch guifg=NONE guibg=NONE gui=reverse cterm=reverse
hi Search    guifg=NONE guibg=NONE gui=reverse cterm=reverse

" statusline
hi StatusLine   guifg=#ebdbb2 guibg=#000000 gui=NONE cterm=NONE
hi StatusLineNC guifg=#ebdbb2 guibg=#000000 gui=NONE cterm=NONE

" tabline
hi TabLine     guifg=#353535 guibg=#000000 gui=NONE cterm=NONE
hi TabLineSel  guifg=#ebdbb2 guibg=#000000 gui=NONE cterm=NONE
hi TabLineFill guifg=#ebdbb2 guibg=#000000 gui=NONE cterm=NONE

" diff
hi DiffAdd    guifg=#b8bb26 guibg=#000000 gui=reverse cterm=reverse
hi DiffChange guifg=#8ec07c guibg=#000000 gui=reverse cterm=reverse
hi DiffDelete guifg=#fb4934 guibg=#000000 gui=reverse cterm=reverse
hi DiffText   guifg=#fabd2f guibg=#000000 gui=reverse cterm=reverse

" coc
hi CocErrorSign guifg=#ff4934 guibg=#000000 gui=NONE cterm=NONE

" coc-git
hi CocGitAddedSign         guifg=#b8bb26 guibg=#000000   gui=NONE cterm=NONE
hi CocGitChangedSign       guifg=#8ec07c guibg=#000000   gui=NONE cterm=NONE
hi CocGitRemovedSign       guifg=#fb4934 guibg=#000000   gui=NONE cterm=NONE
hi CocGitTopRemovedSign    guifg=#fb4934 guibg=#000000   gui=NONE cterm=NONE
hi CocGitChangeRemovedSign guifg=#8ec07c guibg=#000000   gui=NONE cterm=NONE
hi diffAdded               guifg=#b8bb26 guibg=#00000000 gui=NONE cterm=NONE
hi diffRemoved             guifg=#fb4934 guibg=#00000000 gui=NONE cterm=NONE

" fold
hi Folded     guifg=#ebdbb2 guibg=#353535 gui=italic cterm=italic
hi FoldColumn guifg=#ebdbb2 guibg=#000000 gui=NONE   cterm=NONE

" floaterm
hi FloatermBorder guifg=#ebdbb2 guibg=#000000 gui=NONE cterm=NONE

" pmenu
hi Pmenu      guifg=#ebdbb2 guibg=#1d1d1d gui=NONE    cterm=NONE
hi PmenuSel   guifg=#ebdbb2 guibg=#353535 gui=reverse cterm=reverse
hi PmenuSbar  guifg=NONE    guibg=#1d1d1d gui=NONE    cterm=NONE
hi PmenuThumb guifg=NONE    guibg=#353535 gui=NONE    cterm=NONE

" languages
hi Boolean        guifg=#d3869b guibg=NONE    gui=NONE        cterm=NONE
hi Character      guifg=#d3869b guibg=NONE    gui=NONE        cterm=NONE
hi Conditional    guifg=#fb4934 guibg=NONE    gui=NONE        cterm=NONE
hi Constant       guifg=#d3869b guibg=NONE    gui=NONE        cterm=NONE
hi Define         guifg=#8ec07c guibg=NONE    gui=NONE        cterm=NONE
hi Debug          guifg=#fb4934 guibg=NONE    gui=NONE        cterm=NONE
hi Delimiter      guifg=#fe8019 guibg=NONE    gui=NONE        cterm=NONE
hi Exception      guifg=#fb4934 guibg=NONE    gui=NONE        cterm=NONE
hi Float          guifg=#d3869b guibg=NONE    gui=NONE        cterm=NONE
hi Function       guifg=#b8bb26 guibg=NONE    gui=bold        cterm=bold
hi Identifier     guifg=#83a598 guibg=NONE    gui=NONE        cterm=NONE
hi Ignore         guifg=fg      guibg=NONE    gui=NONE        cterm=NONE
hi Include        guifg=#8ec07c guibg=NONE    gui=NONE        cterm=NONE
hi Keyword        guifg=#fb4934 guibg=NONE    gui=NONE        cterm=NONE
hi Label          guifg=#fb4934 guibg=NONE    gui=NONE        cterm=NONE
hi Macro          guifg=#8ec07c guibg=NONE    gui=NONE        cterm=NONE
hi Number         guifg=#d3869b guibg=NONE    gui=NONE        cterm=NONE
hi Operator       guifg=#8ec07c guibg=NONE    gui=NONE        cterm=NONE
hi PreCondit      guifg=#8ec07c guibg=NONE    gui=NONE        cterm=NONE
hi PreProc        guifg=#8ec07c guibg=NONE    gui=NONE        cterm=NONE
hi Repeat         guifg=#fb4934 guibg=NONE    gui=NONE        cterm=NONE
hi SpecialChar    guifg=#fb4934 guibg=NONE    gui=NONE        cterm=NONE
hi SpecialComment guifg=#fb4934 guibg=NONE    gui=NONE        cterm=NONE
hi Statement      guifg=#fb4934 guibg=NONE    gui=NONE        cterm=NONE
hi StorageClass   guifg=#fe8019 guibg=NONE    gui=NONE        cterm=NONE
hi Special        guifg=#fe8019 guibg=NONE    gui=NONE        cterm=NONE
hi String         guifg=#b8bb26 guibg=NONE    gui=italic      cterm=italic
hi Structure      guifg=#8ec07c guibg=NONE    gui=NONE        cterm=NONE
hi Type           guifg=#fabd2f guibg=NONE    gui=NONE        cterm=NONE
hi Typedef        guifg=#fabd2f guibg=NONE    gui=NONE        cterm=NONE
hi Todo           guifg=fg      guibg=#000000 gui=bold,italic cterm=bold,italic
hi Underlined     guifg=#83a598 guibg=NONE    gui=underline   cterm=underline
hi CursorIM       guifg=NONE    guibg=NONE    gui=reverse     ctermfg=NONE ctermbg=NONE cterm=reverse

" markdown
hi def link markdownH1                  htmlH1
hi def link markdownH2                  htmlH2
hi def link markdownH3                  htmlH3
hi def link markdownH4                  htmlH4
hi def link markdownH5                  htmlH5
hi def link markdownH6                  htmlH6
hi def link markdownHeadingRule         markdownRule
hi def link markdownH1Delimiter         markdownHeadingDelimiter
hi def link markdownH2Delimiter         markdownHeadingDelimiter
hi def link markdownH3Delimiter         markdownHeadingDelimiter
hi def link markdownH4Delimiter         markdownHeadingDelimiter
hi def link markdownH5Delimiter         markdownHeadingDelimiter
hi def link markdownH6Delimiter         markdownHeadingDelimiter
hi def link markdownHeadingDelimiter    Delimiter
hi def link markdownOrderedListMarker   markdownListMarker
hi def link markdownListMarker          htmlTagName
hi def link markdownBlockquote          Comment
hi def link markdownRule                PreProc
hi def link markdownFootnote            Typedef
hi def link markdownFootnoteDefinition  Typedef
hi def link markdownLinkText            htmlLink
hi def link markdownIdDeclaration       Typedef
hi def link markdownId                  Type
hi def link markdownAutomaticLink       markdownUrl
hi def link markdownUrl                 Float
hi def link markdownUrlTitle            String
hi def link markdownIdDelimiter         markdownLinkDelimiter
hi def link markdownUrlDelimiter        htmlTag
hi def link markdownUrlTitleDelimiter   Delimiter
hi def link markdownItalic              htmlItalic
hi def link markdownItalicDelimiter     markdownItalic
hi def link markdownBold                htmlBold
hi def link markdownBoldDelimiter       markdownBold
hi def link markdownBoldItalic          htmlBoldItalic
hi def link markdownBoldItalicDelimiter markdownBoldItalic
hi def link markdownCodeDelimiter       Delimiter
hi def link markdownEscape              Special
hi def link markdownError               Error
