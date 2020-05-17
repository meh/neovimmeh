call plug#begin('~/.local/share/nvim/plugged')

" Programming stuff.
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/echodoc.vim'

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-pyclang'
Plug 'ncm2/ncm2-cssomni'
Plug 'ncm2/ncm2-coc'

" Functionality
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'mhinz/vim-grepper'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-rfc'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sjl/gundo.vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'sbdchd/neoformat'
Plug 'easymotion/vim-easymotion'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'junegunn/vim-easy-align'
Plug 'mattn/gist-vim'
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'kennykaye/vim-relativity'
Plug 'racer-rust/vim-racer'
Plug 'roxma/nvim-cm-racer'
Plug 'mattn/webapi-vim'
Plug 'shime/vim-livedown'
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-sleuth'
Plug 'aserebryakov/vim-todo-lists'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'derekelkins/agda-vim'

" Navigation
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-line'
Plug 'kentaro/vim-textobj-function-php'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'glts/vim-textobj-comment'
Plug 'reedes/vim-textobj-sentence'
Plug 'thinca/vim-textobj-between'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-eunuch'

" Syntax
Plug 'jparise/vim-graphql'
Plug 'digitaltoad/vim-pug'
Plug 'LnL7/vim-nix'
Plug 'evanleck/vim-svelte'
Plug 'wilriker/gcode.vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'gisphm/vim-gitignore'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'udalov/kotlin-vim'
Plug 'shiracamus/vim-syntax-x86-objdump-d'
Plug 'vim-scripts/ttcn-syntax'
Plug 'vim-scripts/proguard.vim'
Plug 'raymond-w-ko/vim-niji'
Plug 'nfnty/vim-nftables'
Plug 'beyondmarc/glsl.vim'
Plug 'guns/vim-clojure-static'
Plug 'kchmck/vim-coffee-script'
Plug 'hail2u/vim-css3-syntax'
Plug 'vim-scripts/ebnf.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'jimenezrick/vimerl'
Plug 'tpope/vim-haml'
Plug 'vim-scripts/haskell.vim'
Plug 'vim-scripts/jam.vim'
Plug 'pangloss/vim-javascript'
Plug 'OrangeT/vim-csharp'
Plug 'vim-scripts/JSON.vim'
Plug 'groenewege/vim-less'
Plug 'plasticboy/vim-markdown'
Plug 'juvenn/mustache.vim'
Plug 'programble/ooc.vim'
Plug 'petdance/vim-perl'
Plug 'uarun/vim-protobuf'
Plug 'vim-scripts/rfc-syntax'
Plug 'vim-ruby/vim-ruby'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'keith/swift.vim'
Plug 'HerringtonDarkholme/yats.vim'

call plug#end()

" Numbers
let g:relativity_buftype_ignore = ['nofile', 'terminal']
let g:relativity_filetype_ignore = ['controlp', 'nerdtree', 'fugitive', 'tagbar', 'agsv', 'gitcommit']

autocmd TermOpen * set nonu

" Grepper
let g:grepper = {}
let g:grepper.quickfix = 0

command! -nargs=+ -complete=file Rg Grepper -noprompt -tool rg -query <args>

" Rust syntax
let g:rust_recommended_style = 0

" delimitMate
let g:delimitMate_no_esc_mapping = 1

" NERDTree
let NERDTreeIgnore=['\.so$', '\.o$', '\.la$', '\.a$', '\.class$', '\~$', '\.beam$', '^Mnesia.', 'deps/', '\.hi$', 'vendor/', 'target/']

" NoHomo
let g:nohomo_ignore_filetype = ['mail', 'markdown', 'scss', 'mustache']

" Signify
let g:signify_sign_overwrite = 1
let g:signify_vcs_list = ["git"]

" Rainbows
let g:niji_darkblood_colours = [
	\ ['255', '255'],
	\ ['253', '253'],
	\ ['251', '251'],
	\ ['249', '249'],
	\ ['247', '247'],
	\ ['245', '245'],
	\ ['243', '243'],
	\ ['241', '241'],
	\ ['239', '239'],
	\ ['237', '237'],
	\ ['235', '235'],
	\]

" cctree
let g:CCTreeUsePerl        = 1
let g:CCTreeUseUTF8Symbols = 1

" Clojure
let g:clojure_align_multiline_strings = 1
let g:clojure_fuzzy_indent            = 1
let g:clojure_fuzzy_indent_patterns   = "with.*,def.*,let.*,case.*"

" ri
nnoremap <Leader>ri :call ri#OpenSearchPrompt(0)<CR>
nnoremap <Leader>RI :call ri#OpenSearchPrompt(1)<CR>
nnoremap <Leader>RK :call ri#LookupNameUnderCursor()<CR>

" startify
let g:startify_skiplist = [
             \ 'COMMIT_EDITMSG',
             \ $VIMRUNTIME .'/doc',
             \ 'bundle/.*/doc' ,
             \ 'vimpager'
             \ ]

" ack
if executable('rg')
	let g:ackprg = 'rg --vimgrep'
endif

" vimpager
let vimpager_disable_x11 = 1

if exists("vimpager")
	set statusline=\ 
	set fillchars=stl:\ ,stlnc:\ ,vert:\ ,fold:\ 
	set listchars=tab:\ \ ,trail:\ ,extends:\ ,precedes:\ 
	set list
	set laststatus=0
	set norelativenumber
	set nonumber
endif

" ncm2
let g:ncm2_pyclang#library_path = '/usr/lib64/libclang.so'
let g:ncm2_pyclang#args_file_path = ['.clang_complete']

autocmd BufEnter * call ncm2#enable_for_buffer()
autocmd TextChangedI * call ncm2#auto_trigger()

autocmd FileType c,cpp nnoremap <buffer> gd :<c-u>call ncm2_pyclang#goto_declaration()<cr>

" vinarise
let g:vinarise_enable_auto_detect = 1
let g:vinarise_detect_large_file_size = -1

autocmd FileType vinarise
	\  nmap <buffer> <C-l> :wincmd l<CR>
	\| nmap <buffer> <C-c> <Plug>(vinarise_redraw)

" gist
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'echo %URL% | xclip'
let g:gist_post_private = 1

" neoformat
let g:neoformat_only_msg_on_error = 1

" fzf
let g:fzf_layout = { 'down': '35%' }

" cpp-enhanced
let c_no_curly_error = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

" livedown
let g:livedown_browser = "firefox-developer-edition"

" markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'rust', 'json']

" ale
let g:ale_lint_on_text_changed = 'never'

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:ale_cpp_gcc_options = '-std=c++17 -Wall -fpermissive'
let g:ale_cpp_clang_options = '-std=c++17 -Wall -fpermissive'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" session
set sessionoptions-=buffers
let g:prosession_dir = "~/.config/nvim/sessions"
let g:prosession_per_branch = 1
let g:prosession_on_startup = 1

" rainbow
let g:rainbow_active = 1

let g:rainbow_conf = {
\	'ctermfgs': [237, 240, 243, 246, 249, 252, 255],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold', 'start=/</ end=/>/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\	}
\}

" coc

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

""" Markdown Preview
let g:mkdp_browser = 'qutebrowser'

""" LaTeX
let g:livepreview_previewer = 'mupdf'
let g:livepreview_engine = 'xelatex'
