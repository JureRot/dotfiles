-- set leader to space
vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '

-- set termguicolors
vim.opt.termguicolors = true

-- set number relativenumber
vim.opt.number = true
--vim.o.numberwidth = 2
vim.opt.relativenumber = true
--vim.o.signcolumn = "yes" --signcolumn is the column left to numbercolumn, used for git status or something

-- set wrap linebreak
vim.opt.wrap = true
vim.opt.linebreak = true

-- set incsearch ignorecase smartcase nohlsearch
--vim.o.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false --should be better (hl when jumping to, but not after or something)

-- filetype plugin indent on
-- syntax enable
-- set encoding=utf8

-- tabs settings
vim.opt.tabstop = 4 -- tab counts for 4 spaces
--vim.opt.softtabstop = 4 -- also for editing operations ??
vim.opt.shiftwidth = 4 -- how big is the indent (e.g. for if() of function)
-- vim.opt.expandtab = false -- make sure it actually inserts tabs not spaces

-- (smartindent ?)
-- vim.opt.smartindent = true -- do this if lsp+treesitter dont do it already

-- make so new line after comment isnt automatically a comment (see help: formatoptions, fo-table)
-- need to create autocmd because else its overvritten by /after/ftplugin
vim.api.nvim_create_autocmd({"BufNewFile", "BufEnter", "BufRead"}, { callback = function()
	vim.opt.formatoptions = vim.opt.formatoptions - { "c","r","o" }
end, })

-- show tab indent indicator
vim.opt.list = true -- needed for listchars to work
vim.opt.listchars = { tab = '| ' }

-- set cursorline
vim.opt.cursorline = true

-- set colorcoumn=81
vim.opt.colorcolumn = "80"

-- numb of rows above/below when strolling
vim.opt.scrolloff = 8

-- split windows below and to the right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- fast update time
-- vim.opt.updatetime = 50 -- use this if you see performance issues

-- netrw settings (now using nvim-tree)
--[[
vim.g.netrw_winsize = "-28" -- vertical size of 30 columns
vim.g.netrw_banner = "0" -- no banner on top
vim.g.netrw_liststyle = "3" -- tree-style listing
vim.g.netrw_sort_sequence = "[\\/]$,*" -- directories on top, files below
vim.g.netrw_browse_split = "4" --use previous window to open file
--]]

-- clipboard (OS specific)
-- wsl settup using win32yank (win32yank.exe must be in $PATH (/usr/local/bin)
vim.g.clipboard = {
	['name'] = 'win32yank-wls',
	['copy'] = {
		['+'] = 'win32yank.exe -i --crlf',
		['*'] = 'win32yank.exe -i --crlf',
	},
	['paste'] = {
		['+'] = 'win32yank.exe -o --crlf',
		['*'] = 'win32yank.exe -o --crlf',
	},
	cache_enabled = 0,
}
