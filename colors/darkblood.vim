hi clear

if exists("syntax on")
	syntax reset
endif

let g:colors_name = "darkblood"

" make stuff more readable
set fillchars=stl:\ ,stlnc:\ ,vert:│,fold:\ 
set listchars=tab:·\ ,trail:░,extends:»,precedes:«,eol:\ 
set list
set termguicolors

if &term =~ "cancer"
  silent !echo -ne "\0235cursor:bg:\#404040\0234"
  let &t_SI = "\235cursor:bg:-\234"
  let &t_EI = "\235cursor:bg:\#404040\234"
  autocmd VimLeave * :silent !echo -ne "\0235cursor:bg:-\0234"
endif

"" Enable undercurls in terminal
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"

" Enable underline colors (ANSI), see alacritty #4660
let &t_AU = "\<esc>[58;5;%dm"

" Colorscheme
if !empty($DISPLAY) && $COLORTERM !~# '^rxvt'
    " Enable true colors, see :help xterm-true-color
    if &term =~# '^\(tmux\|screen\|st\|alacritty\)'
        let &t_8f = "\<esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<esc>[48;2;%lu;%lu;%lum"
    endif

    " Enable underline colors (RGB), see alacritty #4660
    let &t_8u = "\<esc>[58;2;%lu;%lu;%lum"
endif

" General colors
hi Normal
  \ cterm=NONE ctermfg=251 ctermbg=black
  \ gui=NONE guifg=#c6c6c6 guibg=#000000

hi Directory
  \ cterm=NONE ctermfg=red ctermbg=NONE
  \ gui=NONE guifg=#b21818 guibg=NONE

hi ErrorMsg
  \ cterm=NONE ctermfg=124 ctermbg=NONE
  \ gui=NONE guifg=#b21818 guibg=NONE

hi NonText
  \ cterm=NONE ctermfg=darkgray ctermbg=NONE
  \ gui=NONE guifg=#686868 guibg=NONE

hi Whitespace
  \ cterm=NONE ctermfg=236 ctermbg=NONE
  \ gui=NONE guifg=#303030 guibg=NONE

hi SpecialKey
  \ cterm=NONE ctermfg=236 ctermbg=NONE
  \ gui=NONE guifg=#303030 guibg=NONE

hi LineNr
  \ cterm=NONE ctermfg=darkgrey ctermbg=NONE
  \ gui=NONE guifg=#686868 guibg=NONE

hi IncSearch
  \ cterm=bold ctermfg=232 ctermbg=124
  \ gui=bold guifg=#000000 guibg=#b21818

hi Search
  \ cterm=bold ctermfg=232 ctermbg=124
  \ gui=bold guifg=#000000 guibg=#b21818

hi CurSearch
  \ cterm=bold ctermfg=124 ctermbg=255
  \ gui=bold guifg=#b21818 guibg=#ffffff

hi Visual
  \ cterm=NONE ctermfg=white ctermbg=124
  \ gui=NONE guifg=#ffffff guibg=#b21818

hi VisualNOS
  \ cterm=NONE ctermfg=white ctermbg=124
  \ gui=NONE guifg=#ffffff guibg=#b21818

hi MoreMsg
  \ cterm=bold ctermfg=white ctermbg=NONE
  \ gui=bold guifg=#ffffff guibg=NONE

hi Question
  \ cterm=bold ctermfg=white ctermbg=NONE
  \ gui=bold guifg=#ffffff guibg=NONE

hi WarningMsg
  \ cterm=bold ctermfg=255 ctermbg=124
  \ gui=bold guifg=#ffffff guibg=#b21818

hi WildMenu
  \ cterm=NONE ctermfg=white ctermbg=NONE
  \ gui=NONE guifg=#ffffff guibg=NONE

hi TabLine
  \ cterm=underline ctermfg=white ctermbg=NONE
  \ gui=underline guifg=#ffffff guibg=NONE

hi TabLineSel
  \ cterm=underline ctermfg=white ctermbg=124
  \ gui=underline guifg=#ffffff guibg=#b21818

hi TabLineFill
  \ cterm=underline ctermfg=white ctermbg=NONE
  \ gui=underline guifg=#ffffff guibg=NONE

hi DiffAdd
  \ cterm=NONE ctermfg=darkgreen ctermbg=NONE
  \ gui=NONE guifg=#1b8218 guibg=NONE

hi DiffChange
  \ cterm=NONE ctermfg=208 ctermbg=NONE
  \ gui=NONE guifg=#be5f00 guibg=NONE

hi DiffDelete
  \ cterm=NONE ctermfg=124 ctermbg=NONE
  \ gui=NONE guifg=#b21818 guibg=NONE

hi DiffText
  \ cterm=NONE ctermfg=white ctermbg=NONE
  \ gui=NONE guifg=#ffffff guibg=NONE

hi SignColumn
  \ cterm=NONE ctermfg=124 ctermbg=NONE
  \ gui=NONE guifg=#b21818 guibg=NONE

hi VertSplit
  \ cterm=NONE ctermfg=124 ctermbg=NONE
  \ gui=NONE guifg=#b21818 guibg=NONE

hi WinSeparator
  \ cterm=NONE ctermfg=124 ctermbg=NONE
  \ gui=NONE guifg=#b21818 guibg=NONE

hi CursorColumn
  \ cterm=NONE ctermfg=NONE ctermbg=233
  \ gui=NONE guifg=NONE guibg=#121212

hi CursorLineNr
  \ cterm=NONE ctermfg=NONE ctermbg=233
  \ gui=NONE guifg=NONE guibg=#121212

hi CursorLine
  \ cterm=NONE ctermfg=NONE ctermbg=233
  \ gui=NONE guifg=NONE guibg=#121212

hi ColorColumn
  \ cterm=NONE ctermfg=NONE ctermbg=233
  \ gui=NONE guifg=NONE guibg=#121212

hi Cursor
  \ cterm=bold ctermfg=white ctermbg=124
  \ gui=bold guifg=#ffffff guibg=#b21818

hi Title
  \ cterm=bold ctermfg=white ctermbg=NONE
  \ gui=bold guifg=#ffffff guibg=NONE

hi Pmenu
  \ cterm=NONE ctermfg=NONE ctermbg=233
  \ gui=NONE guifg=NONE guibg=#121212

hi PmenuSel
  \ cterm=bold ctermfg=white ctermbg=124
  \ gui=bold guifg=#ffffff guibg=#b21818

hi PmenuSbar
  \ cterm=NONE ctermfg=233 ctermbg=233
  \ gui=NONE guifg=#121212 guibg=#121212

hi PmenuThumb
  \ cterm=NONE ctermfg=124 ctermbg=124
  \ gui=NONE guifg=#b21818 guibg=#b21818

hi Folded
  \ cterm=NONE ctermfg=124 ctermbg=NONE
  \ gui=NONE guifg=#b21818 guibg=NONE

hi FoldColumn
  \ cterm=NONE ctermfg=124 ctermbg=NONE
  \ gui=NONE guifg=#b21818 guibg=NONE

hi MatchParen
  \ cterm=bold,underline ctermfg=255 ctermbg=NONE
  \ gui=bold,underline guifg=#ffffff guibg=NONE

hi NvimString
  \ cterm=NONE ctermfg=124 ctermbg=NONE
  \ gui=NONE guifg=#b21818 guibg=NONE

" Diagnostics
hi DiagnosticError
  \ cterm=NONE ctermfg=196 ctermbg=NONE
  \ gui=NONE guifg=#ff5454 guibg=NONE

hi DiagnosticWarn
  \ cterm=NONE ctermfg=208 ctermbg=NONE
  \ gui=NONE guifg=#be5f00 guibg=NONE

hi DiagnosticInfo
  \ cterm=NONE ctermfg=251 ctermbg=NONE
  \ gui=NONE guifg=#c6c6c6 guibg=NONE

hi DiagnosticHint
  \ cterm=NONE ctermfg=darkgrey ctermbg=NONE
  \ gui=NONE guifg=#686868 guibg=NONE

hi DiagnosticOk
  \ cterm=NONE ctermfg=darkgreen ctermbg=NONE
  \ gui=NONE guifg=#1b8218 guibg=NONE

" Status line
hi StatusLine
  \ cterm=NONE ctermfg=124 ctermbg=NONE
  \ gui=NONE guifg=#b21818 guibg=NONE

hi StatusLineNC
  \ cterm=NONE ctermfg=124 ctermbg=black
  \ gui=NONE guifg=#b21818 guibg=#000000

hi ModeMsg
  \ cterm=bold ctermfg=white ctermbg=NONE
  \ gui=bold guifg=#ffffff guibg=NONE

hi User1
  \ cterm=bold ctermfg=white ctermbg=NONE
  \ gui=bold guifg=#ffffff guibg=NONE

hi User2
  \ cterm=NONE ctermfg=white ctermbg=NONE
  \ gui=NONE guifg=#ffffff guibg=NONE

hi User3
  \ cterm=bold ctermfg=237 ctermbg=NONE
  \ gui=bold guifg=#3a3a3a guibg=NONE

hi User4
  \ cterm=bold ctermfg=220 ctermbg=NONE
  \ gui=bold guifg=#ffff54 guibg=NONE

hi User5
  \ cterm=bold ctermfg=34 ctermbg=NONE
  \ gui=bold guifg=#54ff54 guibg=NONE

hi User6
  \ cterm=bold ctermfg=160 ctermbg=NONE
  \ gui=bold guifg=#b21818 guibg=NONE

" spellcheck
hi SpellBad
  \ cterm=underline ctermbg=NONE
  \ gui=underline guibg=NONE

hi SpellRare
  \ cterm=bold ctermfg=232 ctermbg=124
  \ gui=bold guifg=#000000 guibg=#b21818

hi SpellLocal
  \ cterm=NONE ctermfg=124 ctermbg=NONE
  \ gui=NONE guifg=#b21818 guibg=NONE

hi SpellCap
  \ cterm=underline ctermfg=251 ctermbg=NONE
  \ gui=underline guifg=#c6c6c6 guibg=NONE

" tty
if &term =~ "linux"
  hi TabLine
    \ cterm=NONE ctermfg=white ctermbg=NONE
    \ gui=NONE guifg=#ffffff guibg=NONE

  hi TabLineSel
    \ cterm=NONE ctermfg=white ctermbg=124
    \ gui=NONE guifg=#ffffff guibg=#b21818

	hi TabLineFill
    \ cterm=NONE ctermfg=white ctermbg=NONE
    \ gui=NONE guifg=#ffffff guibg=NONE

	hi StatusLine
    \ cterm=NONE ctermfg=black ctermbg=124
    \ gui=NONE guifg=#000000 guibg=#b21818

	hi StatusLineNC
    \ cterm=NONE ctermfg=white ctermbg=NONE
    \ gui=NONE guifg=#ffffff guibg=NONE
endif

" LSP
hi LspReferenceRead
  \ cterm=bold ctermbg=235
  \ gui=bold guibg=#1c1c1c

hi LspReferenceText
  \ cterm=bold ctermbg=235
  \ gui=bold guibg=#1c1c1c

hi LspReferenceWrite
  \ cterm=bold ctermbg=235
  \ gui=bold guibg=#1c1c1c

hi NormalFloat
  \ cterm=NONE ctermbg=234
  \ gui=NONE guibg=#1c1c1c

" TreeSitter
hi @field
  \ cterm=NONE ctermfg=NONE ctermbg=NONE
  \ gui=NONE guifg=NONE guibg=NONE

hi @string
  \ cterm=NONE ctermfg=124 ctermbg=NONE
  \ gui=NONE guifg=#b21818 guibg=NONE

hi @property
  \ cterm=NONE ctermfg=NONE ctermbg=NONE
  \ gui=NONE guifg=NONE guibg=NONE

hi @parameter
  \ cterm=NONE ctermfg=NONE ctermbg=NONE
  \ gui=NONE guifg=NONE guibg=NONE

hi @function.builtin
  \ cterm=bold ctermfg=255 ctermbg=NONE
  \ gui=bold guifg=#ffffff guibg=NONE

hi @function.macro
  \ cterm=bold ctermfg=255 ctermbg=NONE
  \ gui=bold guifg=#ffffff guibg=NONE

hi @constant.builtin
  \ cterm=bold ctermfg=124 ctermbg=NONE
  \ gui=bold guifg=#b21818 guibg=NONE

hi @include
  \ cterm=bold ctermfg=255 ctermbg=NONE
  \ gui=bold guifg=#ffffff guibg=NONE

hi @variable
  \ cterm=NONE ctermfg=NONE ctermbg=NONE
  \ gui=NONE guifg=NONE guibg=NONE

hi @variable.builtin
  \ cterm=bold ctermfg=NONE ctermbg=NONE
  \ gui=bold guifg=NONE guibg=NONE

hi @tag
  \ cterm=bold ctermfg=white ctermbg=NONE
  \ gui=bold guifg=#ffffff guibg=NONE

hi @namespace
  \ cterm=NONE ctermfg=white ctermbg=NONE
  \ gui=NONE guifg=#ffffff guibg=NONE

hi link @lsp.type.property @property
hi link @lsp.type.variable @variable
hi link @lsp.type.namespace @namespace
hi link @lsp.type.string @string

" Telescope
hi TelescopeMatching
  \ cterm=bold ctermfg=255 ctermbg=NONE
  \ gui=bold guifg=#ffffff guibg=NONE

" hop
hi HopNextKey
  \ cterm=bold ctermfg=196
  \ gui=bold guifg=#ff5454

hi HopNextKey1
  \ cterm=bold ctermfg=255
  \ gui=bold guifg=#ffffff

hi HopNextKey2
  \ ctermfg=255
  \ guifg=#ffffff

hi HopUnmatched
  \ cterm=NONE ctermfg=240
  \ gui=NONE guifg=#585858

" blankline
hi IndentBlanklineContextChar
  \ ctermfg=235 ctermbg=235
  \ guifg=#1c1c1c guibg=#1c1c1c

hi IndentBlanklineContextStart
  \ ctermbg=235
  \ guibg=#1c1c1c

" Taglist
hi TagListFileName
  \ cterm=NONE ctermfg=124 ctermbg=NONE
  \ gui=NONE guifg=#b21818 guibg=NONE

" Tagbar
hi TagbarVisibilityPublic
  \ cterm=bold ctermfg=white ctermbg=NONE
  \ gui=bold guifg=#ffffff guibg=NONE

" ctrlp
hi CtrlPMatch
  \ cterm=underline ctermfg=white ctermbg=NONE
  \ gui=underline guifg=#ffffff guibg=NONE

hi CtrlPStats
  \ cterm=NONE ctermfg=black ctermbg=124
  \ gui=NONE guifg=#000000 guibg=#b21818

" XML
hi link xmlEndTag Function

" Diff
hi diffIdentical
  \ cterm=NONE ctermfg=white ctermbg=NONE
  \ gui=NONE guifg=#ffffff guibg=NONE

hi diffAdded
  \ cterm=NONE ctermfg=darkgreen ctermbg=NONE
  \ gui=NONE guifg=#1b8218 guibg=NONE

" Python
hi link pythonInclude Statement

" Clojure
hi link clojureKeyword Constant
hi link clojureVariable Identifier
hi link clojureSpecial Keyword

" JavaScript
hi link jsIdentifier Normal

" Java
hi link javaScopeDecl Statement
hi link javaStorageClass Specifier
hi link javaClassDecl Statement
hi link javaMethodDecl Statement
hi link javaExternal Statement

" C
hi link cStructure Keyword
hi link cStorageClass Keyword
hi link Member PreProc
hi link EnumConstant Constant

" C++
hi link cppStructure Keyword
hi link cppStorageClass Keywords

" D
hi link dScopeDecl Statement
hi link dEnum Statement
hi link dStructure Statement
hi link dTypedef Specifier
hi link dStorageClass Specifier
hi link dAttribute Specifier
hi link dAnnotation Statement
hi link dVersionIdentifier Specifier
hi link dTraitsIdentifier Specifier
hi link dDebug Statement

" SASS
hi link sassClass cssClassName
hi link sassClassChar cssClassNameDot

" Rust
hi link rustStorage Specifier
hi link rustSelf    Specifier
hi link rustSigil   Specifier
hi link rustQuestionMark Error

" Kotlin
autocmd Syntax kotlin
	\  hi link ktInclude Statement
	\| hi link ktModifier Statement
	\| hi link ktStructure Specifier

" Haskell
hi link hsModuleName Type
hi link hsType Type
hi link hsStructure Keyword
hi link hsTypedef Keyword
hi link hsModuleStartLabel Keyword
hi link hsImportLabel Keyword
hi link hsVarSym Statement

" signs
hi GitSignsAdd
  \ ctermfg=darkgreen
  \ guifg=#1b8218

hi GitSignsChange
  \ ctermfg=166
  \ guifg=#be5f00

hi GitSignsDelete
  \ ctermfg=darkred
  \ guifg=#b21818

hi MiniDiffSignAdd
  \ ctermfg=darkgreen
  \ guifg=#1b8218

hi MiniDiffSignChange
  \ ctermfg=166
  \ guifg=#be5f00

hi MiniDiffSignDelete
  \ ctermfg=darkred
  \ guifg=#b21818

" noice
hi NotifyBackground
  \ ctermbg=black
  \ guibg=#000000

hi NotifyERRORBorder guifg=#8A1F1F
hi NotifyWARNBorder guifg=#79491D
hi NotifyINFOBorder guifg=#4F6752
hi NotifyDEBUGBorder guifg=#8B8B8B
hi NotifyTRACEBorder guifg=#4F3552
hi NotifyERRORIcon guifg=#F70067
hi NotifyWARNIcon guifg=#F79000
hi NotifyINFOIcon guifg=#A9FF68
hi NotifyDEBUGIcon guifg=#8B8B8B
hi NotifyTRACEIcon guifg=#D484FF
hi NotifyERRORTitle  guifg=#F70067
hi NotifyWARNTitle guifg=#F79000
hi NotifyINFOTitle guifg=#A9FF68
hi NotifyDEBUGTitle  guifg=#8B8B8B
hi NotifyTRACETitle  guifg=#D484FF
hi link NotifyERRORBody Normal
hi link NotifyWARNBody Normal
hi link NotifyINFOBody Normal
hi link NotifyDEBUGBody Normal
hi link NotifyTRACEBody Normal

hi NoiceCmdlineIcon
  \ ctermfg=255
  \ guifg=#ffffff

hi NoiceCmdlineIconSearch
  \ ctermfg=255 cterm=BOLD
  \ guifg=#ffffff gui=BOLD

hi NoiceCmdlinePopupBorder
  \ ctermfg=124 cterm=BOLD
  \ guifg=#b21818 gui=BOLD

hi NoiceCmdlinePopupTitle
  \ ctermfg=255 cterm=BOLD
  \ guifg=#ffffff gui=BOLD

" YAML
hi link yamlBlockMappingKey Function

" indent-blankline
hi IblScope
  \ guisp=#686868

" syntax
hi Comment
  \ cterm=NONE ctermfg=darkgrey ctermbg=NONE
  \ gui=NONE guifg=#686868 guibg=NONE

hi PreProc
  \ cterm=NONE ctermfg=white ctermbg=NONE
  \ gui=NONE guifg=#ffffff guibg=NONE

hi Constant
  \ cterm=NONE ctermfg=124 ctermbg=NONE
  \ gui=NONE guifg=#b21818 guibg=NONE

hi String
  \ cterm=NONE ctermfg=124 ctermbg=NONE
  \ gui=NONE guifg=#b21818 guibg=NONE

hi Type
  \ cterm=NONE ctermfg=124 ctermbg=NONE
  \ gui=NONE guifg=#b21818 guibg=NONE

hi Statement
  \ cterm=bold ctermfg=white ctermbg=NONE
  \ gui=bold guifg=#ffffff guibg=NONE

hi Specifier
  \ cterm=bold ctermfg=124 ctermbg=NONE
  \ gui=bold guifg=#b21818 guibg=NONE

hi Identifier
  \ cterm=NONE ctermfg=124 ctermbg=NONE
  \ gui=NONE guifg=#b21818 guibg=NONE

hi Ignore
  \ cterm=NONE ctermfg=darkgray ctermbg=NONE
  \ gui=NONE guifg=#686868 guibg=NONE

hi Special
  \ cterm=bold ctermfg=white ctermbg=NONE
  \ gui=bold guifg=#ffffff guibg=NONE

hi Error
  \ cterm=NONE ctermfg=white ctermbg=124
  \ gui=NONE guifg=#ffffff guibg=#b21818

hi Todo
  \ cterm=NONE ctermfg=white ctermbg=124
  \ gui=NONE guifg=#ffffff guibg=#b21818

hi Underlined
  \ cterm=NONE ctermfg=124 ctermbg=NONE
  \ gui=NONE guifg=#b21818 guibg=NONE

hi Number
  \ cterm=NONE ctermfg=124 ctermbg=NONE
  \ gui=NONE guifg=#b21818 guibg=NONE

hi Function
  \ cterm=NONE ctermfg=white ctermbg=NONE
  \ gui=NONE guifg=#ffffff guibg=NONE

hi Define
  \ cterm=bold ctermfg=white ctermbg=NONE
  \ gui=bold guifg=#ffffff guibg=NONE

hi Operator
  \ cterm=bold ctermfg=white ctermbg=NONE
  \ gui=bold guifg=#ffffff guibg=NONE

hi link Character       Constant
hi link Number          Constant
hi link Boolean         Constant
hi link Float           Number
hi link Number          Constant
hi link Repeat          Statement
hi link Label           Statement
hi link Keyword         Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Normal
hi link SpecialComment  Special
hi link Debug           Special
hi link Conditional     Statement

hi ActiveWindow
  \ cterm=NONE ctermfg=251 ctermbg=black
  \ gui=NONE guifg=#c6c6c6 guibg=#000000

hi InactiveWindow
  \ cterm=NONE ctermfg=251 ctermbg=233
  \ gui=NONE guifg=#c6c6c6 guibg=#121212
