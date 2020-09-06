"Need to install vim-plug
call plug#begin('~/.nvim/vim-plug')
	"community maintained edition of gruvbox
	Plug 'gruvbox-community/gruvbox'
	"ctrlp fuzzy finder
	"Plug 'kien/ctrlp.vim'
	"fzf + fzf.vim fuzzy finder (ctrlp alternative) * check notes
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	"vim-vinegar to enhance netrw (vim built-in directory browser)
	Plug 'tpope/vim-vinegar'
	"nerdtree (being fazed-out in favor of vim-vinegar)
	Plug 'preservim/nerdtree'
	"rainbow_parentheses bracket pair colorizor
	Plug 'junegunn/rainbow_parentheses.vim'
	"vimade (diminactive alternative) (desaturates inactive windows) *check notes
	Plug 'TaDaa/vimade'
	"vim-slime REPL functionality (from Emacs SLIME)
	Plug 'jpalardy/vim-slime'
	"coc language server protocol support (could be replaced by nvim-lsp)
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"*check notes

"basics
	set termguicolors "doesn't work in mac terminal (install iTerm2)
	set number relativenumber
	set wrap linebreak
	set incsearch ignorecase smartcase nohlsearch
	filetype plugin indent on
	syntax enable
	set encoding=utf8
	"set pyxversion=3 "to set python3 as default for pyx

"set tabs and indents 4 spaces long (instead of 8) (but still tabs (not spaces))
	set tabstop=4
	set shiftwidth=4

"make indented tabs show vertical lines
	set list
	set listchars=tab:\|\ 
	"space above is needed

"hightlith cursor line
	set cursorline

"draw ruler at 80 chars
	set colorcolumn=81

"enable quazi fizzy serch by enabling recursion
	set path+=**

"enable wildmenu
	set wildmenu

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
	"call matchadd('ExtraWhitespace', '^\t*\zs \+')
	"to show errors when leaving instert mode
	autocmd InsertLeave * redraw!

"THEME SETUP
	let g:gruvbox_italic=1 "shifts vertical lines that show indentation in some filetypes
	colorscheme gruvbox
	set background=dark
	let g:grubox_contrast_dark="medium"

"CTRLP SETUP
	"show hidden files (can cause slowdown)
	"let g:ctrlp_show_hidden=1

"FZF.VIM SETUP
	"map ctrl+p in normal mode to :Files (search files in current dir)
	nnoremap <C-p> :Files<CR>
	"map leader(\)+f in normal mode to :BLines (search line in current buffer)
	nnoremap <leader>f :BLines<CR>
	"map leader(\)+g in normal mode to :Rg (search line in current directory) * check notes
	nnoremap <leader>g :Rg<CR>
	"setup previews (cat / bat / highlith)"

	"setup visual maps for seching selected text (yank + ctrl+r ") for buffer (/) and directory(:Rg)
	"setup normal maps for searching text under cursor for buffers and directory

"NETRW / VIM-VINEGAR SETUP
	"shows listing in tree view (can be changed by pressing i)
	let g:netrw_liststyle=3
	"hides banner (can be changed by pressing I)
	let g:netrw_banenr=0

"NERDTREE SETUP
	"set toggle to ctrl+b (like vscode)
	map <C-b> :NERDTreeToggle<CR>
	"show hidden files
	let NERDTreeShowHidden=1
	"remove 'Press ? for help'
	"let NERDTreeMinimalUI=1
	"custom statusline for nerdtree (wip)
	let NERDTreeStatusline='NERD %p%%'
	"make netrw not use nerdtree (but its default)
	let NERDTreeHijackNetrw=0

"RAINBOW PARENTHESES SETUP
	"set brackets to be paired
	let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
	"autostart
	autocmd VimEnter * RainbowParentheses

"VIM-SLIME SETUP
	"use tmux instead of gnu screen (default)
	let g:slime_target = "tmux"
	"create default config
	let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}

"COC SETUP
let g:coc_global_extensions = [
	\ 'coc-pairs',
	\ 'coc-git',
	\ 'coc-snippets',
	\ 'coc-json',
	\ 'coc-python',
	\ 'coc-java',
	\ 'coc-r-lsp',
	\ 'coc-texlab',
	"\ 'coc-bibtex',
	"\ 'coc-spell-checker',
	\ 'coc-markdownlint',
	\ ]
"*check notes

" don't give |ins-completion-menu| messages.
"set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>

"STATUSLINE SETUP
	"set statusline from other file
	source ~/.config/nvim/statusline.vim

"MAPPINGS
"map đ to ctrl+] for jump to tag (subject to change)
	nnoremap <Char-273> <C-]>
"map š to ctrl+t for jump back from tag (subject to change)
	nnoremap <Char-353> <C-t>

"map ctrl + backspace in insert mode to delete the word (built-in ctrl+w shortcut)
	inoremap <C-BS> <C-W>

"move line up and down in normal mode with ctrl+up/down
	"selects the line with V and uses move command to move it up (-2 because it pastes below address) or down (+1) one line
	nnoremap <C-Up> V:m -2<CR>
	nnoremap <C-Down> V:m +1<CR>
"move visual selection up or down with ctrl+up/down
	"uses move command to move it up (-2 from the first selected line) or down (+1 from the last selected line)
	"previous command closes visual selection so use gv command to reselect previously selected text
	"use = command to realign it (auto indentation)
	"use gv command again to reselect previously selected text (because = command closes visual selection)
	vnoremap <C-Up> :m '<-2<CR>gv=gv
	vnoremap <C-Down> :m '>+1<CR>gv=gv

"NOTES:
	"vimade needs pynvim (pip3 install pynvim), and needs to be updated with nvim (pip3 update pynvim)
	"fzf.vim needs fzf
	"fzf.vim :Rg requires ripgrep
	"ubuntu wsl: coc -> checkhealt -> node.js not workin completeley
	"coc-r-lsp needs r language server: R -> install.packages("languageserver")
	"coc-java on mac may need old milestone jdtls
	"coc-r-lsp on mac does not complete brackets for functions
