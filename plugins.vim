call plug#begin('~/.local/share/nvim/plugged')

" Functionality
Plug 'neomake/neomake'
Plug 'mhinz/vim-grepper'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-rfc'
Plug 'wincent/command-t'
Plug 'sjl/gundo.vim'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'Chiel92/vim-autoformat'
Plug 'easymotion/vim-easymotion'
Plug 'mattn/gist-vim'

" Syntax
Plug 'udalov/kotlin-vim'
Plug 'shiracamus/vim-syntax-x86-objdump-d'
Plug 'vim-scripts/proguard.vim'
Plug 'raymond-w-ko/vim-niji'
Plug 'beyondmarc/glsl.vim'
Plug 'guns/vim-clojure-static'
Plug 'kchmck/vim-coffee-script'
Plug 'vim-scripts/Cpp11-Syntax-Support'
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
Plug 'enomsg/vim-haskellConcealPlus'
Plug 'keith/swift.vim'

" Grepper
command! -nargs=+ -complete=file Rg Grepper -noprompt -tool rg -query <args>

" Rust syntax
let g:rust_recommended_style = 0

" delimitMate
let g:delimitMate_no_esc_mapping = 1

" NERDTree
let NERDTreeIgnore=['\.so$', '\.o$', '\.la$', '\.a$', '\.class$', '\~$', '\.beam$', '^Mnesia.', 'deps/', '\.hi$', 'vendor/', 'target/']

" NoHomo
let g:nohomo_ignore_filetype = ['mail', 'markdown', 'scss', 'mustache']

" Syntastic
let g:syntastic_enable_signs         = 1
let g:syntastic_error_symbol         = '!!'
let g:syntastic_style_error_symbol   = '!¡'
let g:syntastic_warning_symbol       = '??'
let g:syntastic_style_warning_symbol = '?¿'

let c_no_curly_error = 1

let g:syntastic_c_checker          = "clang"
let g:syntastic_c_compiler_options = "-std=c11"

let g:syntastic_cpp_checker          = "clang"
let g:syntastic_cpp_compiler_options = "-std=c++11"

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['elixir', 'javascript'] }

" You Complete Me
let g:ycm_global_ycm_extra_conf     = $HOME . '/.vim/ycm.py'
let g:ycm_extra_conf_vim_data       = ['&filetype', 'g:syntastic_c_compiler_options', 'g:syntastic_cpp_compiler_options']
let g:ycm_key_invoke_completion     = '<Leader><Leader><Tab>'

let g:ycm_key_list_select_completion   = ['<Tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<Leader><Tab>', '<Up>']

let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_rust_src_path = $RUST_SRC_PATH

set completeopt=menuone

let g:ycm_filetype_blacklist = {
	\ 'notes' : 1,
	\ 'markdown' : 1,
	\ 'text' : 1,
	\ 'gitcommit': 1,
	\ 'mail': 1,
\}

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

call plug#end()
