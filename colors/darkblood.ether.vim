" Author: meh.

hi clear

if exists("syntax on")
	syntax reset
endif

let g:colors_name = "darkblood.ether"

" make stuff more readable
set fillchars=stl:-,stlnc:-,vert:│,fold:\ 
set listchars=tab:·\ ,trail:░,extends:»,precedes:«
set list

if &term =~ "rxvt"
  silent !echo -ne "\033]12;\#404040\007"
  let &t_SI = "\033]12;\#b21818\007"
  let &t_EI = "\033]12;\#404040\007"
  autocmd VimLeave * :silent !echo -ne "\033]12;\#b21818\007"

  set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
endif

if &term =~ "cancer"
  silent !echo -ne "\0235cursor:bg:\#404040\0234"
  let &t_SI = "\235cursor:bg:-\234"
  let &t_EI = "\235cursor:bg:\#404040\234"
  autocmd VimLeave * :silent !echo -ne "\0235cursor:bg:-\0234"
endif

" General colors
hi Normal        cterm=NONE      ctermfg=251       ctermbg=black
hi Directory     cterm=NONE      ctermfg=magenta   ctermbg=NONE
hi ErrorMsg      cterm=NONE      ctermfg=249       ctermbg=NONE
hi NonText       cterm=NONE      ctermfg=darkgray  ctermbg=NONE
hi Whitespace    cterm=NONE      ctermfg=236       ctermbg=NONE
hi SpecialKey    cterm=NONE      ctermfg=236       ctermbg=NONE
hi LineNr        cterm=NONE      ctermfg=darkgrey  ctermbg=NONE
hi IncSearch     cterm=bold      ctermfg=232       ctermbg=249
hi Search        cterm=bold      ctermfg=232       ctermbg=249
hi Visual        cterm=NONE      ctermfg=white     ctermbg=249
hi VisualNOS     cterm=NONE      ctermfg=white     ctermbg=249
hi MoreMsg       cterm=bold      ctermfg=white     ctermbg=NONE
hi Question      cterm=bold      ctermfg=white     ctermbg=NONE
hi WarningMsg    cterm=underline                   ctermbg=NONE
hi WildMenu      cterm=NONE      ctermfg=white     ctermbg=NONE
hi TabLine       cterm=underline ctermfg=white     ctermbg=NONE
hi TabLineSel    cterm=underline ctermfg=white     ctermbg=249
hi TabLineFill   cterm=underline ctermfg=white     ctermbg=NONE
hi DiffAdd       cterm=NONE      ctermfg=white     ctermbg=darkgreen
hi DiffChange    cterm=underline ctermfg=NONE      ctermbg=NONE
hi DiffDelete    cterm=NONE      ctermfg=white     ctermbg=249
hi DiffText      cterm=NONE      ctermfg=white     ctermbg=NONE
hi SignColumn    cterm=NONE      ctermfg=249       ctermbg=NONE
hi VertSplit     cterm=NONE      ctermfg=249       ctermbg=NONE
hi CursorColumn  cterm=NONE      ctermfg=NONE      ctermbg=233
hi CursorLineNr  cterm=NONE      ctermfg=NONE      ctermbg=233
hi CursorLine    cterm=NONE      ctermfg=NONE      ctermbg=233
hi ColorColumn   cterm=NONE      ctermfg=NONE      ctermbg=233
hi Cursor        cterm=bold      ctermfg=white     ctermbg=249
hi Title         cterm=bold      ctermfg=white     ctermbg=NONE
hi Pmenu         cterm=NONE      ctermfg=NONE      ctermbg=233
hi PmenuSel      cterm=bold      ctermfg=white     ctermbg=249
hi PmenuSbar     cterm=NONE      ctermfg=233       ctermbg=233
hi PmenuThumb    cterm=NONE      ctermfg=249       ctermbg=249
hi Folded        cterm=NONE      ctermfg=249       ctermbg=NONE
hi FoldColumn    cterm=NONE      ctermfg=249       ctermbg=NONE
hi MatchParen    cterm=reverse   ctermfg=NONE      ctermbg=NONE

" Status line
hi StatusLine    cterm=NONE ctermfg=249 ctermbg=NONE
hi StatusLineNC  cterm=NONE ctermfg=249 ctermbg=black
hi ModeMsg       cterm=bold ctermfg=white   ctermbg=NONE

hi User1 cterm=bold ctermfg=white ctermbg=NONE
hi User2 cterm=NONE ctermfg=white ctermbg=NONE
hi User3 cterm=bold ctermfg=237   ctermbg=NONE
hi User4 cterm=bold ctermfg=220   ctermbg=NONE
hi User5 cterm=bold ctermfg=34    ctermbg=NONE
hi User6 cterm=bold ctermfg=160   ctermbg=NONE

" spellcheck
hi SpellBad      cterm=underline                   ctermbg=NONE
hi SpellRare     cterm=bold      ctermfg=232       ctermbg=249
hi SpellLocal    cterm=NONE      ctermfg=249   ctermbg=NONE
hi SpellCap      cterm=underline ctermfg=251       ctermbg=NONE

" tty
if &term =~ "linux"
	hi TabLine       cterm=NONE ctermfg=white ctermbg=NONE
	hi TabLineSel    cterm=NONE ctermfg=white ctermbg=249
	hi TabLineFill   cterm=NONE ctermfg=white ctermbg=NONE
	hi StatusLine    cterm=NONE ctermfg=black ctermbg=249
	hi StatusLineNC  cterm=NONE ctermfg=white ctermbg=NONE
endif

" Taglist
hi TagListFileName cterm=NONE ctermfg=249 ctermbg=NONE

" Tagbar
hi TagbarVisibilityPublic cterm=bold ctermfg=white ctermbg=NONE

" ctrlp
hi CtrlPMatch cterm=underline ctermfg=white     ctermbg=NONE
hi CtrlPStats cterm=NONE ctermfg=black ctermbg=249

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

" Signify
hi SignifySignAdd    cterm=NONE ctermbg=NONE  ctermfg=2
hi SignifySignDelete cterm=NONE ctermbg=NONE  ctermfg=1
hi SignifySignChange cterm=NONE ctermbg=NONE  ctermfg=3

let g:signify_sign_add               = '+'
let g:signify_sign_change            = '±'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '^'

" Coc
hi CocErrorSign   cterm=NONE      ctermfg=white ctermbg=249
hi CocWarningSign cterm=underline ctermfg=white
hi CocInfoSign    cterm=NONE      ctermfg=255
hi CocHintSign    cterm=NONE      ctermfg=238

" YAML
hi link yamlBlockMappingKey Function

" syntax
hi Comment     cterm=NONE ctermfg=darkgrey ctermbg=NONE
hi PreProc     cterm=NONE ctermfg=white    ctermbg=NONE
hi Constant    cterm=NONE ctermfg=249  ctermbg=NONE
hi Type        cterm=NONE ctermfg=249      ctermbg=NONE
hi Statement   cterm=bold ctermfg=white    ctermbg=NONE
hi Specifier   cterm=bold ctermfg=249      ctermbg=NONE
hi Identifier  cterm=NONE ctermfg=249      ctermbg=NONE
hi Ignore      cterm=NONE ctermfg=darkgray ctermbg=NONE
hi Special     cterm=NONE ctermfg=249  ctermbg=NONE
hi Error       cterm=NONE ctermfg=white    ctermbg=249
hi Todo        cterm=NONE ctermfg=white    ctermbg=249
hi Underlined  cterm=NONE ctermfg=249  ctermbg=NONE
hi Number      cterm=NONE ctermfg=249  ctermbg=NONE
hi Function    cterm=NONE ctermfg=white    ctermbg=NONE
hi Define      cterm=bold ctermfg=white    ctermbg=NONE

hi link String          Constant
hi link Character       Constant
hi link Number          Constant
hi link Boolean         Constant
hi link Float           Number
hi link Number          Constant
hi link Repeat          Statement
hi link Label           Statement
hi link Keyword         Statement
hi link Exception       Statement
hi link Operator        Statement
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
