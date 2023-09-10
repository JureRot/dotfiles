-- set termguicolors
vim.o.termguicolors = true

-- set number relativenumber
vim.o.number = true
--vim.o.numberwidth = 2
vim.o.relativenumber = true
--vim.o.signcolumn = "yes" --signcolumn is the column left to numbercolumn, used for git status or something

-- set wrap linebreak
vim.o.wrap = true
vim.o.linebreak = true

-- set incsearch ignorecase smartcase nohlsearch
--vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false --should be better (hl when jumping to, but not after or something)

-- filetype plugin indent on
-- syntax enable
-- set encoding=utf8

-- set tabstop=4
vim.o.tabstop = 4

-- set shiftwidth=4
vim.o.shiftwidth = 4

-- (softtabstop, expandtab ?)
-- (smartindent ?)

-- set list
vim.opt.list = true

-- set listchars=tab:\|\ 
vim.opt.listchars = { tab = '| ' }

-- set cursorline
vim.o.cursorline = true

-- set colorcoumn=81
vim.o.colorcolumn = "81"

-- (scrolloff 8, updatetime 50)
