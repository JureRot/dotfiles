"vim-plug
call plug#begin('~/.vim/vim-plug')
	"gruvbox colorscheme
	Plug 'morhetz/gruvbox'
	"vim-one colorscheme
	"Plug 'rakr/vim-one'
	"lightline
	Plug 'itchyny/lightline.vim'
	"ale
	Plug 'w0rp/ale'
	"nerdtree
	Plug 'scrooloose/nerdtree'
	"lexima (could be alternatives, but lexima worked for now) (COULD BE DONE WITH MACROS)
	Plug 'cohama/lexima.vim'
	"vim-unimpaired / vim-move (done with snippets (i think))
	"supertab for autocomplete (USE CTRL+N MACRO INSTEAD AND CTRL+E TO EXIT (or omni complete ctrl+x-ctrl+o))
	"ctrlp (dont know if needed)
call plug#end()

"BASICS
	set nocompatible
	set termguicolors "cant use in tmux (cbut we can use terminal inside vim so whatever)
	filetype plugin on
	"filetype plugin indent on "(alternative, dont know)
	syntax enable
	set number relativenumber
	set wrap linebreak
	"set autoindent
	set incsearch ignorecase smartcase nohlsearch
	set showcmd "(shows keys pressed in normal mode bottom right)
	set encoding=utf8

"enable quazi fizzy search by enably recursion
	set path+=**
"enable wildmenu
	set wildmenu

"highlight trailing whitespaces (instead of vim-trailing-whitespace plugin)
	"define group ExtraWhitespace
	highlight ExtraWhitespace ctermbg=darkred guibg=darkred
	"override ColorScheme
	autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkred guibg=darkred
	"mathc trailing whitespace but not while typing
	match ExtraWhitespace /\s\+\%#\@<!$/
	"could add for other whitespace problems (tabs not at beginning, spaces before tabs, spaces for indednting)

"set tabs and indents to be 4 spaces long (instead of 8) but still tabs (not actually 4 spaces)
	set tabstop=4
	set shiftwidth=4
	"set expandtab "(makes tabs into spaces)
	"set softtabstop=4 (only shows tabs as 4 spaces long, actually still 8 spaces or something)

"highlight cursor line
	set cursorline

"draw ruler at 80 chars
	set colorcolumn=80

"disable automatic commmenting on new line
	autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"splits to open blow and right (opposite of default)
	set splitbelow splitright

"fix exiting visual mode delay
	set timeoutlen=1000
	set ttimeoutlen=0

"THEME SETUP
	colorscheme gruvbox
	set background=dark
	let g:gruvbox_italic=1
	let g:gruvbox_contrast_dark="medium"

"LIGHTLINE SETUP
	set laststatus=2
	"set ttimeoutlen=50 (if it starts lagging)

"NERDTREE SETUP
	"map <C-n> :NERDTreeToggle<CR>

"ALE SETUP
"only lint on buffer open (enter) and save
	let g:ale_lint_on_text_changed = 0
	let g:ale_lint_on_enter = 1
	let g:ale_lint_on_save = 1
"prevent cursor disappearing on line with error or warning from ALE (on ubuntu)
	"let g:ale_echo_cursor = 0

"MAPPINGS
"map đ to ctrl+] for jump to tag (subject to change)
	nnoremap <Char-273> <C-]>
"map š to ctrl+t for jump back from tag (subject to change)
	nnoremap <Char-353> <C-t>
	
"SNIPPETS
"move line up and donw from normal mode with ctrl+up/down
"selects the line with V and uses move command to move it up (-2 because it pastes below address) or down (+1) one line
	nnoremap <C-Up> V:m -2<CR>
	nnoremap <C-Down> V:m  +1<CR>
"move visual selection up or down with ctrl+up/down
"uses move command to move it up (-2 from the first slected line ) or down (+1 from the last selected line)
	vnoremap <C-Up> :m '<-2<CR>gv
	vnoremap <C-Down> :m '>+1<CR>gv
