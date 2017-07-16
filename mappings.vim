let mapleader=";"
let maplocaleader="\\"

" Tabs
map <silent> <C-T> :tabnew<CR>
map <silent> <C-W> :tabclose<CR>
map <silent> <S-H> :tabprevious<CR>
map <silent> <S-L> :tabnext<CR>

" Windows
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>
nnoremap <silent> <C-j> :wincmd j<CR>

" Other mappings
nmap <Leader>f :CommandT<CR>
nmap <Leader>b :CommandTBuffer<CR>
nmap <Leader>t :CommandTTag<CR>
nmap <Leader>r :CommandTFlush<CR>
nmap <Leader>y :YcmShowDetailedDiagnostic<CR>

nmap <Leader>s :mksession! .vim.session<CR>
nmap <Leader>n :nohlsearch<CR>

nmap <Leader>Y :YcmDiags<CR>
nmap <Leader>R :YcmCompleter ClearCompilationFlagCache<CR>:YcmForceCompileAndDiagnostics<CR>
nmap <Leader>G :YcmComplete GoTo<CR>

nmap <Leader>N :NERDTreeToggle<CR>
nmap <Leader>T :TagbarToggle<CR>
nmap <Leader>U :GundoToggle<CR>
nmap <Leader>S :SyntasticCheck<CR>

vnoremap <silent> <Enter> :EasyAlign<CR>
