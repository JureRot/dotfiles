vim.g.mapleader = " "

-- bind ctrl+backspace (insert mode) to ctrl+w (delete word backwards)
-- vim.keymap.set("i", "<C-BS>", "<C-w>", opts)
--vim.keymap.set("i", "<C-h>", "<C-w>", opts) --workaround for terminals

--[[
-- moving by line in wrapped lines
vim.kemap.set("n", "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })
vim.kemap.set("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })
--]]

-- TODO: bind for highlighting search and keeping it

-- put next search result in the midle
-- vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
-- vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- pasting while having something visually selected does not overwrite yanked value
vim.keymap.set("v", "p", '"_dP', { desc = "Pasting without yanking visually selected" })

-- deleting something does not overwrite yanked value
vim.keymap.set({ "n", "v" }, "<leader>x", '"_d', { desc = "Deleting without yanking" })

-- move selected text (visual mode) up and down with Up and Down arrows
vim.keymap.set("v", "<Down>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<Up>", ":m '<-2<CR>gv=gv", opts)

-- keep visual selection when indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- TODO: bindings for folding (for now is `za` for toggle fold)


-- PLUGIN KEYBINDINGS --

-- nvim-tree
vim.keymap.set("n", "<leader>e", function()
	require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle NvimTree" })

-- gitsigns
vim.keymap.set("n", "<leader>hs", function()
	require("gitsigns").stage_hunk()
end, { desc = "Stage hunk" })
vim.keymap.set("v", "<leader>hs", function()
	require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>hr", function()
	require("gitsigns").reset_hunk()
end, { desc = "Reset hunk" })
vim.keymap.set("v", "<leader>hr", function()
	require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>hS", function()
	require("gitsigns").stage_buffer()
end, { desc = "Stage buffer" })
vim.keymap.set("n", "<leader>hu", function()
	require("gitsigns").undo_stage_hunk()
end, { desc = "Undo stage hunk" })
vim.keymap.set("n", "<leader>hR", function()
	require("gitsigns").reset_buffer()
end, { desc = "Reset buffer" })
vim.keymap.set("n", "<leader>hp", function()
	require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>hb", function()
	require("gitsigns").blame_line({ full = true })
end, { desc = "Blame line" })
vim.keymap.set("n", "<leader>tb", function()
	require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle blame line" })
vim.keymap.set("n", "<leader>hd", function()
	require("gitsigns").diffthis()
end, { desc = "Diff thiss" })
vim.keymap.set("n", "<leader>hD", function()
	require("gitsigns").diffthis('~')
end, { desc = "Diff this (~)" })
--[[
vim.keymap.set("n", "<leader>td", function()
	require("gitsigns").toggle_deleted()
end, { desc = "Diff this (~)" })
--]]


-- telescope
local changed_on_branch = function(local_opts)
	local pickers = require "telescope.pickers"
	local finders = require "telescope.finders"
	local sorters = require "telescope.sorters"
	local previewers = require "telescope.previewers"
	-- local conf = require("telescope.config").values

	opts = local_opts or {}
	pickers.new(opts, {
		prompt_title = "Find Files",
		results_title = "Modified in current branch",
		finder = finders.new_oneshot_job({
			"git",
			"ls-files",
			"--modified",
			"--deleted",
			"--others",
			"--exclude-standard",
			"-t",
			--"status",
			--"--porcelain=v1",
			--"--",
			--"."
		}, {}),
		sorter = sorters.get_fuzzy_file(),
		previewer = previewers.git_file_diff.new(opts), -- doesnt work with this way of finder
	}):find()
end

vim.keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", function()
	require("telescope.builtin").live_grep()
end, { desc = "Grep" })
vim.keymap.set("n", "<leader>gb", function()
	require("telescope.builtin").git_branches()
end, { desc = "Git branches" })
vim.keymap.set("n", "<leader>gc", function()
	require("telescope.builtin").git_status()
end, { desc = "Git changes" })
vim.keymap.set("n", "<leader>fc", function()
	changed_on_branch()
end, { desc = "Git changes (mine)" })
vim.keymap.set("n", "<leader>fd", function()
	require("telescope.builtin").diagnostics()
end, { desc = "Show diagnostics" })


-- harpoon
vim.keymap.set("n", "<leader>m", function()
	require("harpoon.mark").add_file()
end, { desc = "Add file to harpoon" })
vim.keymap.set("n", "<leader>t", function()
	require("harpoon.ui").toggle_quick_menu()
end, { desc = "Toggle harpoon" })
vim.keymap.set("n", "<leader>1", function()
	require("harpoon.ui").nav_file(1)
end, { desc = "Go to 1. harpoon file" })
vim.keymap.set("n", "<leader>2", function()
	require("harpoon.ui").nav_file(2)
end, { desc = "Go to 2. harpoon file" })
vim.keymap.set("n", "<leader>3", function()
	require("harpoon.ui").nav_file(3)
end, { desc = "Go to 3. harpoon file" })
vim.keymap.set("n", "<leader>4", function()
	require("harpoon.ui").nav_file(4)
end, { desc = "Go to 4. harpoon file" })
vim.keymap.set("n", "<leader>5", function()
	require("harpoon.ui").nav_file(5)
end, { desc = "Go to 5. harpoon file" })
vim.keymap.set("n", "<leader>6", function()
	require("harpoon.ui").nav_file(6)
end, { desc = "Go to 6. harpoon file" })
vim.keymap.set("n", "<leader>fm", ":Telescope harpoon marks<CR>", { desc = "Show harpoon marks in telescope" })
