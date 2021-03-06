call plug#begin('~/.vim/vim-plug')
	"gruvbox colorscheme
	Plug 'morhetz/gruvbox'
	"vim-one colorscheme
	"Plug 'rakr/vim-one'
	"lightline (could be done custom)
	Plug 'itchyny/lightline.vim'
	"ale
	Plug 'dense-analysis/ale'
	"nerdtree
	Plug 'scrooloose/nerdtree'
	"vim-vinegar (maybe nerdtree alternative using netrw)
	Plug 'tpope/vim-vinegar'
	"lexima (could be alternatives, but lexima worked for now) (COULD BE DONE WITH MACROS)
	Plug 'cohama/lexima.vim'
	"vim-unimpaired / vim-move (done with snippets (i think))
	"supertab for autocomplete (USE CTRL+N MACRO INSTEAD AND CTRL+E TO EXIT (or omni complete ctrl+x-ctrl+o))
	"ctrlp (dont know if needed, becuase of :find * but still much better fuzzy find)
	Plug 'kien/ctrlp.vim'
	"vim-diminactive (done with autocommands)
	"Plug 'blueyed/vim-diminactive'
	"vimade (diminactive alternatvie, looks amazing, but dosnt work with mac on specific directory)
	"Plug 'TaDaa/vimade'
call plug#end()

"BASICS
	set nocompatible
	set termguicolors "cant use in tmux (but we can use terminal inside vim so whatever)
	filetype plugin on
	"filetype plugin indent on "(alternative, dont know)
	"syntax enable
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

"make indented tabs show vertical lines
	set listchars=tab:\|\ 
	"the space above is intentional
	set list

"highlight cursor line
	set cursorline

"draw ruler at 80 chars
	"set colorcolumn=80 "done in autocommands (dim inactive window)

"disable automatic commmenting on new line
	autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"splits to open below and right (opposite of default)
	set splitbelow splitright

"fix exiting visual mode delay
	set timeoutlen=1000
	set ttimeoutlen=0


"NETRW SETUP
"shows listing in tree view (can be changed by pressing i)
	let g:netrw_liststyle=3
"hides banner (can be changed by pressing I)
	let g:netrw_banner=0

"THEME SETUP
	let g:gruvbox_italic=1 "uncomment if terminal allows italics
	colorscheme gruvbox
	set background=dark
	let g:gruvbox_contrast_dark="medium"

"LIGHTLINE SETUP
"set status line always visible
	set laststatus=2 "make statusline always visible
	"set ttimeoutlen=50 (if it starts lagging)

"NERDTREE SETUP
"keyboard shortcut to ctrl+b (like in vscode) (could be <C-n> but that is already autocomlete in insert mode (plus, this is harder to key -> discourage using))
	map <C-b> :NERDTreeToggle<CR>
	let NERDTreeHijackNetrw=0
"removes 'Press ? for help'
	let NERDTreeMinimalUI=1
"shows hidden files
	let NERDTreeShowHidden=1
"custom statusline for nerdtree (wip)
	"let NERDTreeStatusline="NERD" "JUST PLACEHOLD FOR NOW (MAKING A CUSTOM STATUSLINE)
	let NERDTreeStatusline='%p%%'

"ALE SETUP
"only lint on buffer open (enter) and save (and not on text change)
	let g:ale_lint_on_text_changed = 0
	let g:ale_lint_on_enter = 1
	let g:ale_lint_on_save = 1
"on some versions of gvim (vim-gkt3) on ubuntu cursor may disappear on lines with ALE errors or warnings
"if you really need gvim (clipboard support) use next line to fix
	"let g:ale_echo_cursor = 0

"CTRLP SETUP
"show hidden files (can cause slowdown)
	let g:ctrlp_show_hidden=1


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
"previous command closes visual selection so use gv command to reselect previously selected text
"use = command to realign it (auto indentation)
"use gv command again to reselct previously selected text (because = command closes visual selection)
	vnoremap <C-Up> :m '<-2<CR>gv=gv
	vnoremap <C-Down> :m '>+1<CR>gv=gv

"AUTOCOMMANDS
"dim inactive windows to make the active one more obvious
"make active windows have ruler at 80 characters
	autocmd BufEnter,FocusGained,VimEnter,WinEnter * let &l:colorcolumn=80
"make inactive windows have all (first 255) columns colored (thus making them paler)
	autocmd FocusLost,WinLeave * let &l:colorcolumn=join(range(1, 255), ',')
"we could color LineNr (line numbers) and EndOfBuffer (area under the text) the same color to make it more seamless (but it looks weird)
"(to get the colorcolumn color look in :highlight)

"[just a backup if neovim doesnt work out]
