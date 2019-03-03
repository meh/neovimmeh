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

" Window wrap around.
function! s:GotoNextWindow( direction, count )
  let l:prevWinNr = winnr()
  execute a:count . 'wincmd' a:direction
  return winnr() != l:prevWinNr
endfunction

function! s:JumpWithWrap( direction, opposite )
  if ! s:GotoNextWindow(a:direction, v:count1)
    call s:GotoNextWindow(a:opposite, 999)
  endif
endfunction

nnoremap <silent> <C-w>h :<C-u>call <SID>JumpWithWrap('h', 'l')<CR>
nnoremap <silent> <C-w>j :<C-u>call <SID>JumpWithWrap('j', 'k')<CR>
nnoremap <silent> <C-w>k :<C-u>call <SID>JumpWithWrap('k', 'j')<CR>
nnoremap <silent> <C-w>l :<C-u>call <SID>JumpWithWrap('l', 'h')<CR>
