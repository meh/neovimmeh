call plug#begin('~/.local/share/nvim/plugged')

" Programming stuff.
Plug 'autozimu/LanguageClient-neovim', {
	\ 'do': 'bash install.sh',
	\ 'branch': 'next'
	\ }

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'Shougo/neco-vim'
Plug 'Shougo/echodoc.vim'
Plug 'mhartington/nvim-typescript'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-pyclang'
Plug 'w0rp/ale'

" Functionality
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

" Navigation
Plug 'https://github.com/wellle/targets.vim'
Plug 'https://github.com/kana/vim-textobj-user'
Plug 'https://github.com/kana/vim-textobj-indent'
Plug 'https://github.com/kana/vim-textobj-function'
Plug 'https://github.com/kana/vim-textobj-line'
Plug 'https://github.com/kentaro/vim-textobj-function-php'
Plug 'https://github.com/thinca/vim-textobj-function-javascript'
Plug 'https://github.com/glts/vim-textobj-comment'
Plug 'https://github.com/reedes/vim-textobj-sentence'
Plug 'https://github.com/thinca/vim-textobj-between'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-eunuch'

" Syntax
Plug 'gisphm/vim-gitignore'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'udalov/kotlin-vim'
Plug 'shiracamus/vim-syntax-x86-objdump-d'
Plug 'vim-scripts/ttcn-syntax'
Plug 'vim-scripts/proguard.vim'
Plug 'raymond-w-ko/vim-niji'
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
Plug 'tpope/vim-markdown'
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

" RLS
let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
	\ 'rust': ['rustup', 'run', 'nightly', 'rls'],
	\ }

let g:LanguageClient_diagnosticsDisplay = {
	\	'1': {
	\		"name": "Error",
	\		"texthl": "ErrorMsg",
	\		"signText": "×",
	\		"signTexthl": "ErrorMsg"
	\	},
	\	'2': {
	\		"name": "Warning",
	\		"texthl": "WarningMsg",
	\		"signText": "!",
	\		"signTexthl": "WarningMsg"
	\	},
	\	'3': {
	\			"name": "Information",
	\			"texthl": "ALEInfo",
	\			"signText": "i",
	\			"signTexthl": "ALEInfoSign"
	\	},
	\	'4': {
	\		"name": "Hint",
	\		"texthl": "ALEInfo",
	\		"signText": "≫",
	\		"signTexthl": "ALEInfoSign"
	\	} }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>

" Completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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

" Command-T
let g:CommandTMaxFiles            = 100000
let g:CommandTMaxDepth            = 100
let g:CommandTNeverShowDotFiles   = 1
let g:CommandTFileScanner         = "git"
let g:CommandTGitIncludeUntracked = 1

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

" vimshell
let g:vimshell_environment_term       = 'rxvt-256color'
let g:vimshell_scrollback_limit       = 10240

autocmd FileType vimshell
	\ nnoremap <silent> <C-k> :wincmd k<CR>

autocmd FileType int-*
	\ nnoremap <silent> <C-k> :wincmd k<CR>

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
let g:fzf_layout = { 'down': '10' }

" cpp-enhanced
let c_no_curly_error = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

" livedown
let g:livedown_browser = "firefox-developer-edition"

" markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'rust', 'json']

" ncm2
let g:ncm2_pyclang#library_path = '/usr/lib64/libclang.so'
let g:ncm2_pyclang#args_file_path = ['.clang_complete']

autocmd BufEnter * call ncm2#enable_for_buffer()
autocmd TextChangedI * call ncm2#auto_trigger()

autocmd FileType c,cpp nnoremap <buffer> gd :<c-u>call ncm2_pyclang#goto_declaration()<cr>

" ale
let g:ale_lint_on_text_changed = 'never'

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:ale_cpp_gcc_options = '-std=c++17 -Wall -fpermissive'
let g:ale_cpp_clang_options = '-std=c++17 -Wall -fpermissive'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
