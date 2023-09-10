-- Bootstrapping method to install lazy package manager

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {

	-- colorscheme 
	'sainnhe/sonokai',
	-- 'ellisonleao/gruvbox.nvim', -- ugly integration with fugitive and gitsigns (alternatives: 'sainnhe/gruvbox-material', 'luisiacc/gruvbox-baby')
	-- 'navarasu/onedark.nvim',
	-- jetbrains (new ui) dracula theme?

	-- statusline
	{ 'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	-- file navigation, grep
	{ 'nvim-telescope/telescope.nvim',
		tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	-- syntax highlighting
	{ 'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate'
	},

	-- gui-type file navigation (nerdtree/nvim-tree/neotree)?
	{ 'nvim-tree/nvim-tree.lua',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	-- git integration
	'tpope/vim-fugitive',
	'lewis6991/gitsigns.nvim',
	'ThePrimeagen/git-worktree.nvim',

	-- lsp
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',

	-- autocompletion + snippets
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/cmp-nvim-lua',
	'L3MON4D3/LuaSnip',
	'windwp/nvim-autopairs',
	-- 'saadparwaiz1/cmp_luasnip' -- additional vscode like snippets
	-- 'rafamadriz/friendly-snippets'

	-- github copilot (requires nodejs)
	--  'github/copilot.vim' -- :Copilot to authenticate

	-- undootree

	-- other plugins
	-- highlighted todos in comments
	{ 'folke/todo-comments.nvim',
	  dependencies = 'nvim-lua/plenary.nvim',
	},

	-- better marks
	'chentoast/marks.nvim',

	-- code context (alternatives: 	barbecue.nvim, nvim-navic)
	'nvim-treesitter/nvim-treesitter-context',

	-- bufferline (like tabline (or lualine) but for open buffers (because i dont use tabs))
	--{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
	{'romgrk/barbar.nvim',
		dependencies = {
			'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
			'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
		version = '^1.0.0', -- optional: only update when a new 1.x version is released
	},

	-- harpoon (simple mark-like file navigation)
	'ThePrimeagen/harpoon',
}

local opts = {}

require("lazy").setup(plugins, opts)
