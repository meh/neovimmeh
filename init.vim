ru plugins.vim
ru status.vim
ru helper.vim
ru commands.vim
ru mappings.vim

colorscheme darkblood

" Ignore files.
set wildignore+=*.o,*.obj,.git,*.a,*.so,*.lo,*.class,*.beam,deps/*,Mnesia.*,*.hi,vendor/*,copycat/*,target/*,_build/*

" Set undo history.
set undofile
set undolevels=1000
set undoreload=10000

" Indentation.
set autoindent
set smartindent
set preserveindent
set smarttab
set smartcase
set shiftwidth=2
set ts=2
set noexpandtab
set modeline
set tildeop
set cpoptions+=$
set backspace=2
set breakindent
set nowrap

" Gotta go wild.
set wildmode=longest:full
set wildmenu

" Random crap.
set emoji
set magic
set hidden
set shortmess+=c

" Resize windows on outer window resize.
autocmd VimResized * wincmd =
