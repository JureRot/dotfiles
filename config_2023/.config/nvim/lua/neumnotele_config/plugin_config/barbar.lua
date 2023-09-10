--vim.g.barbar_auto_setup = false -- disable auto-setup

require'barbar'.setup{
	clickable = true,
	icons = {
		diagnostics = {
			[vim.diagnostic.severity.ERROR] = {enabled = true, icon = ' '},
			[vim.diagnostic.severity.WARN] = {enabled = true, icon = ' '},
			[vim.diagnostic.severity.INFO] = {enabled = false},
			[vim.diagnostic.severity.HINT] = {enabled = false},
		},
		-- dont like it that i cant diable numbers (only icons)
		-- would much rather have only an icon if any gitchange so maybe disalbe if too much (but than i could just use bufferline instead of barbar)
		gitsigns = {
			added = {enabled = true, icon = '+'},
			changed = {enabled = true, icon = '~'},
			deleted = {enabled = true, icon = '-'},
		},
		-- could disable icons for inactive buffers
		--[[
		inactive = {
			diagnostics = {
				[vim.diagnostic.severity.ERROR] = {enabled = false},
				...
			},
		},
		--]]
	},
}
