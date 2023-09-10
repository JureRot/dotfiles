
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>m", mark.add_file)
vim.keymap.set("n", "<leader>t", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end)
vim.keymap.set("n", "<leader>6", function() ui.nav_file(6) end)


-- todo add prev and next bindings
--vim.keymap.set("n", "<leader>4", function() ui.nav_prev() end)
--vim.keymap.set("n", "<leader>4", function() ui.nav_next() end)


vim.keymap.set("n", "<leader>fm", ":Telescope harpoon marks<CR>")

--NOTE
-- rearanging, editing and deleting harpoon marks is done in harpoon quick menu as it were a normal buffer (editing it as normal text in vim)
-- there is also a tmux integration (but i dont know what it does and how is it useful)

require("harpoon").setup({
})
