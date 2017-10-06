let mapleader=";"
let maplocaleader="\\"

nnoremap <C-t>h  :tabprev<CR>
nnoremap <C-t>j  :tabfirst<CR>
nnoremap <C-t>k  :tablast<CR>
nnoremap <C-t>l  :tabnext<CR>
nnoremap <C-t>t  :tabedit<Space>
nnoremap <C-t>n  :tabnext<Space>
nnoremap <C-t>m  :tabm<Space>
nnoremap <C-t>d  :tabclose<CR>

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
