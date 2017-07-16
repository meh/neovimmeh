" Helper mappings.
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

nnoremap <F3> :set invcul cul?<CR>
imap <F3> <C-o>:set invcul cul?<CR>

nnoremap <F4> :set invcursorcolumn cursorcolumn?<CR>
imap <F4> <C-o>:set invcursorcolumn cursorcolumn?<CR>

nnoremap <F5> :call ColorColumnToggle()<CR>
imap <F5> <C-o>:call ColorColumnToggle()<CR>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

nnoremap <C-c> :redraw!<CR>
imap <C-c> <C-o>:redraw!<CR>

function! ColorColumnToggle()
	if &colorcolumn
		set colorcolumn=
	else
		set colorcolumn=80
	endif
endfunction

augroup cline
	au!
	au WinLeave * set nocursorline
	au WinEnter * set cursorline

	au InsertEnter * set nocursorline
	au InsertLeave * set cursorline

	au VimEnter * set cursorline
augroup END
