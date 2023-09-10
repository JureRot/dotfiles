local builtin = require('telescope.builtin')

function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
--vim.keymap.set('n', '<C-p>', ':lua require("telescope.builtin").find_files({hidden=true})<CR>' , {})
--vim.keymap.set('n', '<leader>fg', ':lua require("telescope.builtin").find_files({hidden=true})<CR>', {})
vim.keymap.set('n', '<C-p>', builtin.find_files, {}) -- because we set hidden=true in setup
vim.keymap.set('n', '<leader>fg', builtin.find_files, {})
-- vim.keymap.set('n', '{make binding}', builtin.git_fils, {})
--vim.keymap.set('n', '<Space><Space>', builtin.old_files, {}) -- this are recently used files
-- normal mode global find or selected text global find if in visual mode
vim.keymap.set('n', '<leader>ff', builtin.live_grep, {})
vim.keymap.set('v', '<leader>ff', function()
	local text = vim.getVisualSelection()
	builtin.live_grep({ default_text = text })
end)
-- todo need better binds (leader plus one key or two keys bun on different fingers (fg is no bueno))
-- todo need buffers search
-- todo need git branches search
vim.keymap.set('n', '<leader>fs', builtin.grep_string, {}) --this is live_grep for string under cursor
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        -- ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
	find_files = {
		hidden = true
	},
	live_grep = {
		additional_args = function()
			return {"--hidden"}
		end
	},
	grep_string = {
		additional_args = function()
			return {"--hidden"}
		end
	},
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}


-- load extensions
require("telescope").load_extension('harpoon')
require("telescope").load_extension("git_worktree")
