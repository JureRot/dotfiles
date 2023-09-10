require("todo-comments").setup {
	signs = true, -- show icons in the signs column (overrides gitsigns signcolumn (maybe turn it off))
	sign_priority = 8, -- sign priority
	-- keywords recognized as todo comments
	keywords = {
		TODO = { icon = " ", color = "todo", alt = { "todo", }, signs = false, },
		NOTE = { icon = " ", color = "note", alt = { "INFO", }, },
		WARN = { icon = " ", color = "warning", alt = { "WARNING", }, },
		FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", }, },
		-- there some other like hack, perf and test in defaults
	},
	gui_style = {
		fg = "NONE", -- The gui style to use for the fg highlight group.
		bg = "BOLD", -- The gui style to use for the bg highlight group.
	},
	-- merge_keywords = true, -- when true, custom keywords will be merged with the defaults
	merge_keywords = false, -- still matches all default keywords if set to true (not just the provided in keywords)
	-- highlighting of the line containing the todo comment
	-- * before: highlights before the keyword (typically comment characters)
	-- * keyword: highlights of the keyword
	-- * after: highlights after the keyword (todo text)
	highlight = {
		--multiline = true, -- enable multine todo comments
		multiline = false, --  (colors all comments below with after value but not from the beginning of the line)
		multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
		multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
		before = "", -- "fg" or "bg" or empty
		keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
		after = "fg", -- "fg" or "bg" or empty
		-- pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
		pattern = [[.*<(KEYWORDS)\s*]], -- dont need : after keyword
		comments_only = true, -- uses treesitter to match keywords in comments only
		max_line_len = 400, -- ignore lines longer than this
		exclude = {}, -- list of file types to exclude highlighting
	},
	-- list of named colors where we try to extract the guifg from the
	-- list of highlight groups or use the hex color if hl not found as a fallback
	colors = {
		todo = { "#2563EB" },
		error = { "Red", "#DC2626" }, -- red: #f85e84 (for solokai colorscheme)
		warning = { "Yellow", "#FBBF24" }, -- yellow: e5c463
		note = { "Green", "#10B981" }, -- green: 9ecd6f
		-- the defaults
		-- error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
		-- warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
		-- info = { "DiagnosticInfo", "#2563EB" },
		-- hint = { "DiagnosticHint", "#10B981" },
		-- default = { "Identifier", "#7C3AED" },
		-- test = { "Identifier", "#FF00FF" }
	},
	search = {
		command = "rg",
		args = {
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
		},
		-- regex that will be used to match keywords.
		-- don't replace the (KEYWORDS) placeholder
		pattern = [[\b(KEYWORDS):]], -- ripgrep regex
		-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
	},
}


--[[
-- dont have that much use for jumping between them (just use vim serch)
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- You can also specify a list of valid jump keywords

vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
end, { desc = "Next error/warning todo comment" })
--]]
