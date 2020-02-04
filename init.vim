call plug#begin('~/.nvim/vim-plug')
	"gruvbox colorscheme
	Plug 'morhetz/gruvbox'
call plug#end()

"basics
	"set nocompatible
	set termguicolors "doesn't work in mac terminal (install iTerm2)
	set number relativenumber
	set wrap linebreak
	set incsearch ignorecase smartcase nohlsearch
	filetype plugin indent on
	syntax enable
	set encoding=utf8

"set tabs and indents 4 spaces long (instead of 8) (but still tabs (not spaces))
	set tabstop=4
	set shiftwidth=4

"make indented tabs show vertical lines
	set list
	set listchars=tab:\|\ 
	"space above is needed

"hightlith cursort line
	set cursorline

"draw ruler at 80 chars
	set colorcolumn=81

"disable automatic commenting on new line
	autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"splits to open below and to the right (opposite of default)
	set splitbelow splitright

"highlight trailing whitespace (instead of vim-trailing-whitespace plugin)
	"define group
	highlight ExtraWhitespace ctermbg=darkred guibg=darkred
	"override colorscheme with custom group hightlight
	autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkred guibg=darkred
	"match trailing whitespace but not while typing
	call matchadd('ExtraWhitespace', '\s\+\%#\@<!$')
	"match spaces before a tab
	call matchadd('ExtraWhitespace', ' \+\ze\t')
	"match spaces used for indenting
	call matchadd('ExtraWhitespace', '^\t*\zs \+')
	"to show errors when leaving instert mode
	autocmd InsertLeave * redraw!

"THEME SETUP
	let g:gruvbox_italic=1 "shifts vertical lines that show indentation in some filetypes
	colorscheme gruvbox
	set background=dark
	let g:grubox_contrast_dark="medium"
