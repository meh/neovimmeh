hi clear

if exists("syntax on")
	syntax reset
endif

let g:colors_name = "darkblood"

" make stuff more readable
set fillchars=stl:\ ,stlnc:\ ,vert:│,fold:\ 
set listchars=tab:·\ ,trail:░,extends:»,precedes:«,eol:\ 
set list
set notermguicolors

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
hi Normal        cterm=NONE           ctermfg=251       ctermbg=black
hi Directory     cterm=NONE           ctermfg=red       ctermbg=NONE
hi ErrorMsg      cterm=NONE           ctermfg=124   ctermbg=NONE
hi NonText       cterm=NONE           ctermfg=darkgray  ctermbg=NONE
hi Whitespace    cterm=NONE           ctermfg=236       ctermbg=NONE
hi SpecialKey    cterm=NONE           ctermfg=236       ctermbg=NONE
hi LineNr        cterm=NONE           ctermfg=darkgrey  ctermbg=NONE
hi IncSearch     cterm=bold           ctermfg=232       ctermbg=124
hi Search        cterm=bold           ctermfg=232       ctermbg=124
hi Visual        cterm=NONE           ctermfg=white     ctermbg=124
hi VisualNOS     cterm=NONE           ctermfg=white     ctermbg=124
hi MoreMsg       cterm=bold           ctermfg=white     ctermbg=NONE
hi Question      cterm=bold           ctermfg=white     ctermbg=NONE
hi WarningMsg    cterm=bold           ctermfg=255       ctermbg=124
hi WildMenu      cterm=NONE           ctermfg=white     ctermbg=NONE
hi TabLine       cterm=underline      ctermfg=white     ctermbg=NONE
hi TabLineSel    cterm=underline      ctermfg=white     ctermbg=124
hi TabLineFill   cterm=underline      ctermfg=white     ctermbg=NONE
hi DiffAdd       cterm=NONE           ctermfg=darkgreen ctermbg=NONE guifg=green
hi DiffChange    cterm=NONE           ctermfg=208       ctermbg=NONE guifg=208
hi DiffDelete    cterm=NONE           ctermfg=124   ctermbg=NONE guifg=192
hi DiffText      cterm=NONE           ctermfg=white     ctermbg=NONE guifg=white
hi SignColumn    cterm=NONE           ctermfg=124   ctermbg=NONE
hi VertSplit     cterm=NONE           ctermfg=124   ctermbg=NONE
hi WinSeparator  cterm=NONE           ctermfg=124   ctermbg=NONE
hi CursorColumn  cterm=NONE           ctermfg=NONE      ctermbg=233
hi CursorLineNr  cterm=NONE           ctermfg=NONE      ctermbg=233
hi CursorLine    cterm=NONE           ctermfg=NONE      ctermbg=233
hi ColorColumn   cterm=NONE           ctermfg=NONE      ctermbg=233
hi Cursor        cterm=bold           ctermfg=white     ctermbg=124
hi Title         cterm=bold           ctermfg=white     ctermbg=NONE
hi Pmenu         cterm=NONE           ctermfg=NONE      ctermbg=233
hi PmenuSel      cterm=bold           ctermfg=white     ctermbg=124
hi PmenuSbar     cterm=NONE           ctermfg=233       ctermbg=233
hi PmenuThumb    cterm=NONE           ctermfg=124   ctermbg=124
hi Folded        cterm=NONE           ctermfg=124   ctermbg=NONE
hi FoldColumn    cterm=NONE           ctermfg=124   ctermbg=NONE
hi MatchParen    cterm=bold,underline ctermfg=255       ctermbg=NONE
hi NvimString    cterm=NONE           ctermfg=124   ctermbg=NONE

" Diagnostics
hi DiagnosticError cterm=NONE ctermfg=196       ctermbg=NONE
hi DiagnosticWarn  cterm=NONE ctermfg=208       ctermbg=NONE
hi DiagnosticInfo  cterm=NONE ctermfg=251       ctermbg=NONE
hi DiagnosticHint  cterm=NONE ctermfg=darkgrey  ctermbg=NONE
hi DiagnosticOk    cterm=NONE ctermfg=darkgreen ctermbg=NONE

" Status line
hi StatusLine    cterm=NONE ctermfg=124 ctermbg=NONE
hi StatusLineNC  cterm=NONE ctermfg=124 ctermbg=black
hi ModeMsg       cterm=bold ctermfg=white   ctermbg=NONE

hi User1 cterm=bold ctermfg=white ctermbg=NONE
hi User2 cterm=NONE ctermfg=white ctermbg=NONE
hi User3 cterm=bold ctermfg=237   ctermbg=NONE
hi User4 cterm=bold ctermfg=220   ctermbg=NONE
hi User5 cterm=bold ctermfg=34    ctermbg=NONE
hi User6 cterm=bold ctermfg=160   ctermbg=NONE

" spellcheck
hi SpellBad      cterm=underline                   ctermbg=NONE
hi SpellRare     cterm=bold      ctermfg=232       ctermbg=124
hi SpellLocal    cterm=NONE      ctermfg=124   ctermbg=NONE
hi SpellCap      cterm=underline ctermfg=251       ctermbg=NONE

" tty
if &term =~ "linux"
	hi TabLine       cterm=NONE ctermfg=white ctermbg=NONE
	hi TabLineSel    cterm=NONE ctermfg=white ctermbg=124
	hi TabLineFill   cterm=NONE ctermfg=white ctermbg=NONE
	hi StatusLine    cterm=NONE ctermfg=black ctermbg=124
	hi StatusLineNC  cterm=NONE ctermfg=white ctermbg=NONE
endif

" LSP
hi LspReferenceRead cterm=bold ctermbg=235
hi LspReferenceText cterm=bold ctermbg=235
hi LspReferenceWrite cterm=bold ctermbg=235
hi NormalFloat cterm=NONE ctermbg=234

" TreeSitter
hi @field cterm=NONE ctermfg=NONE ctermbg=NONE
hi @string cterm=NONE ctermfg=124  ctermbg=NONE
hi @property cterm=NONE ctermfg=NONE ctermbg=NONE
hi @parameter cterm=NONE ctermfg=NONE ctermbg=NONE
hi @function.builtin cterm=bold ctermfg=255 ctermbg=NONE
hi @function.macro cterm=bold ctermfg=255 ctermbg=NONE
hi @constant.builtin cterm=bold ctermfg=124 ctermbg=NONE
hi @include cterm=bold ctermfg=255 ctermbg=NONE
hi @variable cterm=NONE ctermfg=NONE ctermbg=NONE
hi @variable.builtin cterm=bold ctermfg=NONE ctermbg=NONE
hi @tag cterm=bold ctermfg=white ctermbg=NONE
hi @namespace cterm=NONE ctermfg=white ctermbg=NONE

hi link @lsp.type.property @property
hi link @lsp.type.variable @variable
hi link @lsp.type.namespace @namespace
hi link @lsp.type.string @string

" Telescope
hi TelescopeMatching cterm=bold ctermfg=255 ctermbg=NONE

" hop
hi HopNextKey   cterm=bold ctermfg=196
hi HopNextKey1  cterm=bold ctermfg=255
hi HopNextKey2             ctermfg=255
hi HopUnmatched cterm=NONE ctermfg=240

" blankline
hi IndentBlanklineContextChar ctermfg=235 ctermbg=235
hi IndentBlanklineContextStart ctermbg=235

" Taglist
hi TagListFileName cterm=NONE ctermfg=124 ctermbg=NONE

" Tagbar
hi TagbarVisibilityPublic cterm=bold ctermfg=white ctermbg=NONE

" ctrlp
hi CtrlPMatch cterm=underline ctermfg=white     ctermbg=NONE
hi CtrlPStats cterm=NONE ctermfg=black ctermbg=124

" XML
hi link xmlEndTag Function

" Diff
hi diffIdentical cterm=NONE ctermfg=white ctermbg=NONE
hi diffAdded     cterm=NONE ctermfg=darkgreen ctermbg=NONE

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

" YAML
hi link yamlBlockMappingKey Function

" indent-blankline
hi IblScope guisp=darkgrey

" syntax
hi Comment     cterm=NONE ctermfg=darkgrey ctermbg=NONE
hi PreProc     cterm=NONE ctermfg=white    ctermbg=NONE
hi Constant    cterm=NONE ctermfg=124  ctermbg=NONE
hi String      cterm=NONE ctermfg=124  ctermbg=NONE
hi Type        cterm=NONE ctermfg=124      ctermbg=NONE
hi Statement   cterm=bold ctermfg=white    ctermbg=NONE
hi Specifier   cterm=bold ctermfg=124      ctermbg=NONE
hi Identifier  cterm=NONE ctermfg=124      ctermbg=NONE
hi Ignore      cterm=NONE ctermfg=darkgray ctermbg=NONE
hi Special     cterm=bold ctermfg=white    ctermbg=NONE
hi Error       cterm=NONE ctermfg=white    ctermbg=124
hi Todo        cterm=NONE ctermfg=white    ctermbg=124
hi Underlined  cterm=NONE ctermfg=124  ctermbg=NONE
hi Number      cterm=NONE ctermfg=124  ctermbg=NONE
hi Function    cterm=NONE ctermfg=white    ctermbg=NONE
hi Define      cterm=bold ctermfg=white    ctermbg=NONE
hi Operator    cterm=bold ctermfg=white    ctermbg=NONE

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
