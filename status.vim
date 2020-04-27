" Status line
let s:last_window_id = 0
function StatusLine_id(winnr)
	let r = getwinvar(a:winnr, 'window_id')

	if empty(r)
		let r = s:last_window_id
		let s:last_window_id += 1

		call setwinvar(a:winnr, 'window_id', r)
	endif

	" Without this condition it triggers unneeded statusline redraw
	if getwinvar(a:winnr, '&statusline') isnot# '%!StatusLine_render('.r.')'
		call setwinvar(a:winnr, '&statusline', '%!StatusLine_render('.r.')')
	endif

	return r
endfunction

function StatusLine_git()
	if !exists('b:git_dir')
		return
	endif

	let b:git_head = fugitive#head(7)

  let cd  = exists('*haslocaldir') && haslocaldir() ? 'lcd ' : 'cd '
	let dir = getcwd()

  try
		let root = b:git_dir

		if match(root, '\.git$') != -1
			let root = root[0:-5]
		endif

		let full = expand('%:p')
		let rel  = full[strlen(root) : strlen(full)]

		execute cd.root

		let status = system('git status --porcelain --ignored -- ' . shellescape(full))
		if strlen(l:status) != 1
			let b:git_status = l:status[0:2]
		endif

		let diff = system('git branch -v -v | grep "^\*.*[.*?: .*?]" | sed -e "s@^.*\[[A-Za-z]*/[A-Za-z]*: \(.*[0-9][0-9]*\)\]*.*\$@\1@"')
		if strlen(l:diff)
			let b:git_diff = split(l:diff)
		else
			let b:git_diff = []
		endif

		return b:git_status
  finally
    execute cd.'`=dir`'
  endtry
endfunction

function StatusLine_entry(current, bufnr)
	let render = ''

	if a:bufnr == -1
		if a:current
			let render .= "%1*!%*"
		else
			let render .= "%3*!%*"
		endif
	else
		let modifiable = getbufvar(a:bufnr, '&modifiable')
		let readonly   = getbufvar(a:bufnr, '&readonly')
		let modified   = getbufvar(a:bufnr, '&modified')

		if modifiable && !readonly && !modified
			if a:current
				let render .= "%1*!%*"
			else
				let render .= "%3*!%*"
			endif
		endif

		if !modifiable || readonly
			if a:current
				let render .= "%1*⭤%*"
			else
				let render .= "%3*⭤%*"
			endif
		endif

		if modified
			if a:current
				let render .= "%1*+%*"
			else
				let render .= "%3*+%*"
			endif
		endif
	endif

	return render
endfunction

function StatusLine_render_help(winnr, bufnr, current)
	let left    = ""
	let right   = ""

	let left .= "["
	let left .= StatusLine_entry(a:current, -1)
	let left .= " %1*%{expand('%:t:r')}%*"
	let left .= "] "

	let right .= " [%1*help%*]"
	let right .= " [%1*%p%%%*]"

	return left . "%=" . right
endfunction

function StatusLine_render_none(winnr)
	return repeat('─', winwidth(a:winnr))
endfunction

function StatusLine_render_normal(winnr, bufnr, current)
	let left    = ""
	let right   = ""

	if strlen(bufname(a:bufnr))
		let entry = StatusLine_entry(a:current, a:bufnr)

		let left .= "["
		let left .= StatusLine_entry(a:current, a:bufnr)
		if strlen(l:entry)
			let left .= " "
		endif
		let left .= "%2*%{substitute(expand('%:h'), expand('$HOME'), '~', 'g')}/%1*%{expand('%:t')}%*"
		let left .= "] "
	else
		let left .= "[" . StatusLine_entry(a:current, a:bufnr) . "] "
	endif

	let git_head   = getbufvar(a:bufnr, 'git_head')
	let git_status = getbufvar(a:bufnr, 'git_status')
	let git_diff   = getbufvar(a:bufnr, 'git_diff')

	if strlen(l:git_head)
		let left .= "["
		if strlen(l:git_status)
			if l:git_status[1] == 'M' && l:git_status[0] != 'M'
				let left .= "%4*%* "
			elseif l:git_status[0] == 'A' || l:git_status[0] == 'M'
				let left .= "%5*%* "
			elseif l:git_status[0] == 'D'
				let left .= "%6*%* "
			else
				let left .= "%1*%* "
			endif
		else
			let left .= "%1*%* "
		endif
		let left .= "%2*" . l:git_head . "%*"

		if len(l:git_diff) == 2
			let left .= ' '

			if l:git_diff[0] == 'ahead'
				let left .= '>> '
			else
				let left .= '<< '
			endif

			let left .= "%2*" . l:git_diff[1] . "%*"
		endif

		let left .= "] "
	endif

	let coc = get(b:, 'coc_diagnostic_info', {})
	if !empty(coc)
		let msgs = []

	if get(coc, 'error', 0)
			call add(msgs, "%6*" . coc['error'] . "!%*")
	endif

		if get(coc, 'warning', 0)
			call add(msgs, "%4*" . coc['warning'] . "?%*")
		endif

		if get(coc, 'information', 0) + get(coc, 'hint', 0)
			call add(msgs, "%5*" . coc['information'] + coc['hint'] . "~%*")
		endif

	let right .= " [" . join(msgs, ' ') . "%*]"
	endif

	if strlen(getwinvar(a:winnr, '&filetype'))
		let right .= " [%1*⭢⭣ %{&filetype}%* %2*%{&enc}%*]"
	else
		let right .= " [%1*⭢⭣%* %2*%{&enc}%*]"
	endif

	let right .= " [%1* %l%*:%2*%c%* %1*%p%%%*]"

	return left . "%=" . right
endfunction

function StatusLine_render(window_id)
	let winnr   = index(map(range(1, winnr('$')), 'StatusLine_id(v:val)'), a:window_id) + 1
	let bufnr   = winbufnr(l:winnr)
	let current = w:window_id is# a:window_id
	let buf     = bufname(l:bufnr)

	if getwinvar(l:winnr, '&filetype') == 'help'
		return StatusLine_render_help(l:winnr, l:bufnr, l:current)
	elseif l:buf =~ "NERD_tree" || l:buf =~ "Tagbar" || l:buf =~ "man:" || l:buf =~ "term:" || l:buf =~ "Command-T" || &ft == 'gitcommit'
		return StatusLine_render_none(l:winnr)
	else
		return StatusLine_render_normal(l:winnr, l:bufnr, l:current)
	endif
endfunction

function StatusLine_new()
	call map(range(1, winnr('$')), 'StatusLine_id(v:val)')
endfunction

autocmd BufWritePost * call StatusLine_git()
autocmd BufReadPost *  call StatusLine_git()
autocmd WinEnter *  call StatusLine_git()
autocmd VimEnter * call StatusLine_git()

set showmode
set laststatus=2
set statusline=%!StatusLine_new()
