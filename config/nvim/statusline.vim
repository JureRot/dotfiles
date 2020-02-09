"FOR NOW JUST A KNOCK OF OF LIGHTLINE (COULD BE PERSONALIZED)

function! GetPath() abort
	let l:basename=expand('%:p')
	if l:basename == '' || l:basename == '.'
		return ''
	else
		" Make sure we show $HOME as ~.
		return substitute(l:basename . '/', '\C^' . $HOME, '~', '')
	endif
endfunction

function! ActiveStatus()
	let statusline=""

	if (mode()=='n')

		"mode
		let statusline.="%#NormalLabel#"
		let statusline.="%\ \ NORMAL\ "

		"path
		let statusline.="%#AllPath#"
		let statusline.="%\ \ "
		"truncate if too long
		let statusline.="%<"
		let l:path=GetPath()
		"shorten nicely
		let l:maxPath=float2nr(floor((winwidth(0)-30)*0.75))
		if (len(l:path) > l:maxPath)
			let l:path=l:path[len(l:path)-l:maxPath:len(l:path)]
			let l:path=substitute(l:path, "[^/]*", "...", "")
		endif
		let statusline.=l:path

		"file name
		let statusline.="%#AllFile#"
		let statusline.="%\ %t\ "

		"modified
		let statusline.="%#AllModified#"
		let statusline.="%m"
		if (&modified)
			let statusline.="\ "
		endif

		let statusline.="%#AllMiddle#"

		"break
		let statusline.="%="

		"percentage in file
		let statusline.="%#AllPercent#"
		let statusline.="%\ \ %p%%\ "

		"line:column
		let statusline.="%#AllLineColumn#"
		let statusline.="%4l:%-3c\ "
	endif

	if (mode()=='i')
		let statusline.="%#InsertLabel#"
		let statusline.="%\ \ INSERT\ "

		let statusline.="%#InsertPath#"
		let statusline.="%\ \ "
		let statusline.="%<"
		let l:path=GetPath()
		let l:maxPath=float2nr(floor((winwidth(0)-30)*0.75))
		if (len(l:path) > l:maxPath)
			let l:path=l:path[len(l:path)-l:maxPath:len(l:path)]
			let l:path=substitute(l:path, "[^/]*", "...", "")
		endif
		let statusline.=l:path

		let statusline.="%#InsertFile#"
		let statusline.="%\ %t\ "

		let statusline.="%#InsertModified#"
		let statusline.="%m"
		if (&modified)
			let statusline.="\ "
		endif

		let statusline.="%#InsertMiddle#"

		let statusline.="%="

		let statusline.="%#InsertPercent#"
		let statusline.="%\ \ %p%%\ "

		let statusline.="%#InsertLineColumn#"
		let statusline.="%4l:%-3c\ "
	endif

	if (mode()=='R')
		let statusline.="%#ReplaceLabel#"
		let statusline.="%\ \ RPLACE\ "

		let statusline.="%#AllPath#"
		let statusline.="%\ \ "
		let statusline.="%<"
		let l:path=GetPath()
		let l:maxPath=float2nr(floor((winwidth(0)-30)*0.75))
		if (len(l:path) > l:maxPath)
			let l:path=l:path[len(l:path)-l:maxPath:len(l:path)]
			let l:path=substitute(l:path, "[^/]*", "...", "")
		endif
		let statusline.=l:path

		let statusline.="%#AllFile#"
		let statusline.="%\ %t\ "

		let statusline.="%#AllModified#"
		let statusline.="%m"
		if (&modified)
			let statusline.="\ "
		endif

		let statusline.="%#AllMiddle#"

		let statusline.="%="

		let statusline.="%#AllPercent#"
		let statusline.="%\ \ %p%%\ "

		let statusline.="%#AllLineColumn#"
		let statusline.="%4l:%-3c\ "
	endif

	if (mode()=='V')
		let statusline.="%#VisualLabel#"
		let statusline.="%\ \ VISUAL\ "

		let statusline.="%#AllPath#"
		let statusline.="%\ \ "
		let statusline.="%<"
		let l:path=GetPath()
		let l:maxPath=float2nr(floor((winwidth(0)-30)*0.75))
		if (len(l:path) > l:maxPath)
			let l:path=l:path[len(l:path)-l:maxPath:len(l:path)]
			let l:path=substitute(l:path, "[^/]*", "...", "")
		endif
		let statusline.=l:path

		let statusline.="%#AllFile#"
		let statusline.="%\ %t\ "

		let statusline.="%#AllModified#"
		let statusline.="%m"
		if (&modified)
			let statusline.="\ "
		endif

		let statusline.="%#AllMiddle#"

		let statusline.="%="

		let statusline.="%#AllPercent#"
		let statusline.="%\ \ %p%%\ "

		let statusline.="%#AllLineColumn#"
		let statusline.="%4l:%-3c\ "
	endif


	return statusline
endfunction

function! InactiveStatus()
	let statusline=""
	let statusline.="%#InactivePath#"
	let statusline.="%\ \ "
	let statusline.="%<"
	let l:path=GetPath()
		let l:maxPath=float2nr(floor((winwidth(0)-30)*0.75))
	if (len(l:path) > l:maxPath)
		let l:path=l:path[len(l:path)-l:maxPath:len(l:path)]
		let l:path=substitute(l:path, "[^/]*", "...", "")
	endif
	let statusline.=l:path

	let statusline.="%#InactiveFile#"
	let statusline.="%\ %t\ "

	let statusline.="%#InactiveModified#"
	let statusline.="%m"
		if (&modified)
			let statusline.="\ "
		endif

	let statusline.="%#InactiveMiddle#"

	let statusline.="%="

	let statusline.="%#InactivePercent#"
	let statusline.="%\ \ %p%%\ "

	let statusline.="%#InactiveLineColumn#"
	let statusline.="%4l:%-3c\ "

	return statusline
endfunction


set laststatus=2
set statusline=
set statusline+=%!ActiveStatus()
hi NormalLabel guifg=#282828 guibg=#98971a
hi InsertLabel guifg=#076678 guibg=#fbf1c7
hi ReplaceLabel guifg=#fbf1c7 guibg=#cc241d
hi VisualLabel guifg=#282828 guibg=#d65d0e

hi AllPath guifg=#d5c4a1 guibg=#665c54
hi InsertPath guifg=#d5c4a1 guibg=#076678
hi InactivePath guifg=#a89984 guibg=#3c3836

hi AllFile gui=bold guifg=#fbf1c7 guibg=#665c54
hi InsertFile gui=bold guifg=#fbf1c7 guibg=#076678
hi InactiveFile gui=bold guifg=#a89984 guibg=#3c3836

hi AllModified guifg=#a89984 guibg=#665c54
hi InsertModified guifg=#a89984 guibg=#076678
hi InactiveModified guifg=#7c6f64 guibg=#3c3836

"FILETYPE
"ENCODING

hi AllMiddle guifg=#665c54 guibg=#504945
hi InsertMiddle guifg=#ffffff guibg=#044450
hi InactiveMiddle guifg=#ffffff guibg=#282828

hi AllPercent guifg=#d5c4a1 guibg=#665c54
hi InsertPercent guifg=#d5c4a1 guibg=#076678
hi InactivePercent guifg=#a89984 guibg=#3c3836

hi AllLineColumn guifg=#665c54 guibg=#d5c4a1
hi InsertLineColumn guifg=#076678 guibg=#d5c4a1
hi InactiveLineColumn guifg=#3c3836 guibg=#a89984

augroup status
	autocmd!
	autocmd WinEnter * setlocal statusline=%!ActiveStatus()
	autocmd WinLeave * setlocal statusline=%!InactiveStatus()
augroup END

"[https://www.reddit.com/r/vim/comments/6b7b08/my_custom_statusline/]
"[https://gist.github.com/ahmedelgabri/b9127dfe36ba86f4496c8c28eb65ef2b]
"[https://stackoverflow.com/questions/57239294/how-to-make-sure-proper-statusline-highlighting-is-loaded-from-vimrc-in-vim]
"[https://github.com/wincent/wincent/blob/b56f4cad2c5c073fd/roles/dotfiles/files/.vim/autoload/statusline.vim]
