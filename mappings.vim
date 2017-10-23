let mapleader=";"
let maplocaleader="\\"

nnoremap <C-t>h :tabprev<CR>
nnoremap <C-t>j :tabfirst<CR>
nnoremap <C-t>k :tablast<CR>
nnoremap <C-t>l :tabnext<CR>
nnoremap <C-t>t :tabedit<Space>
nnoremap <C-t>n :tabnext<Space>
nnoremap <C-t>m :tabm<Space>
nnoremap <C-t>d :tabclose<CR>

" Other mappings
nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>t :Tags<CR>

nmap <Leader>s :mksession! .vim.session<CR>
nmap <Leader>n :nohlsearch<CR>

nmap <Leader>N :NERDTreeToggle<CR>
nmap <Leader>T :TagbarToggle<CR>
nmap <Leader>U :GundoToggle<CR>

vnoremap <silent> <Enter> :EasyAlign<CR>
