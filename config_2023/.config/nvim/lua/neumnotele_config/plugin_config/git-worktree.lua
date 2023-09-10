require("git-worktree").setup({
    --[[
	change_directory_command = <str> -- default: "cd",
    update_on_change = <boolean> -- default: true,
    update_on_change_command = <str> -- default: "e .",
    clearjumps_on_change = <boolean> -- default: true,
    autopush = <boolean> -- default: false,
	--]]
})


vim.keymap.set("n", "<leader>fwt", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")

-- todo add other bindings
