-- gruvbox (has problems)
-- vim.cmd("colorscheme gruvbox") -- ugly and unclear display for gitsigns (hunk preview) and fugitive (Gvdiff)
-- vim.cmd("colorscheme gruvbox-material") -- doesnt look like gruvbox
-- vim.cmd("colorscheme gruvbox-baby") -- more like gruvbox but still not that close

-- onedark (this one is very good, no complaints)
--[[
require('onedark').setup {
    style = 'warmer'
}
require('onedark').load()
--]]

-- sonokai (this one feels better (for now)) (also work great with fugitive and gitsigns
vim.g.sonokai_style = 'shusia' -- default is also good
vim.g.sonokai_menu_selection_background = 'green'
-- change visual highlight color (bg3 default for shusia: #423f46, bg4 default for shusia: #49464e)
-- vim.cmd([[ let g:sonokai_colors_override = {'bg3': ['#514e56', '237']} ]]) -- same as below but old syntax
vim.g.sonokai_colors_override = {['bg3'] = {'#514e56', '237'}, ['bg4'] = {'#58555e', '237'}} -- this is how you use tables (dictionaries) in lua
--vim.g.sonokai_diagnostic_virtual_text = 'highlighted' -- default is grey and is way less obrucive
vim.cmd.colorscheme 'sonokai'
