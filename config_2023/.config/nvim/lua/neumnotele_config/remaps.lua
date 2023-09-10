local opts = { noremap = true, silent = true }

-- bind leader + pv to explorer (now using nvim-tree)
--[[
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, opts)
-- bind ctrl + b to explorer on the left side (additional settings for netrw in settings.lua)
vim.keymap.set("n", "<C-b>", vim.cmd.Lexplore, opts) -- this should be improved (conflict with tmux leader (C-b), bad with dygma raise config)
--]]

-- bind leader e to nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts) -- this should be improved (conflict with tmux leader (C-b), bad with dygma raise config)

-- bind ctrl+backspace to ctrl+w (deletes word backwards)
vim.keymap.set("i", "<C-BS>", "<C-w>", opts)
vim.keymap.set("i", "<C-h>", "<C-w>", opts) -- workaround because terminal interpretes ctrl+backspace as ctrl+h

-- move selected text (visual) up and down with J and K
vim.keymap.set("v", "<Down>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<Up>", ":m '<-2<CR>gv=gv", opts)

-- window navigation (instead of ctrl+w -> hjkl its just ctrl+hjkl) (dont use windows that much (especially if get used to tmux))
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
--todo add windows resizing bindings

-- buffer navitation (not that useful because i cant rearange buffers (better to use git changed files or recent files or harpoon))
vim.keymap.set("n", "<S-h>", ":bprev<CR>", opts) -- could type straight up capital letter instead of <S-letter>
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)

-- visual mode paste does not overwrite yanked value (delets to empty register and than pastes (above))
vim.keymap.set("v", "p", '"_dP', opts)

-- yank to clipboard using Y (for normal mode, whole line and visual selection) (maybe use <leader>y instead)
vim.keymap.set("n", "<S-y>", '"*y', opts)
vim.keymap.set("n", "<S-y><S-y>", '"*yy', opts) -- if we use <leader>y we can use "*Y instead of "*yy
vim.keymap.set("v", "<S-y>", '"*y', opts)
