-- nvim-cmp and nvim-autopairs config
local cmp = require("cmp")
local npairs = require('nvim-autopairs')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.setup({
	mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
	snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    sources = cmp.config.sources({ -- add more sources here if need be (order matters)
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
	  { name = 'path' },
	}),
	experimental = {
		ghost_text = true
	},
	enabled = function()
      -- disable completion in comments
      local context = require 'cmp.config.context'
      -- keep command mode completion enabled when cursor is in a comment
      if vim.api.nvim_get_mode().mode == 'c' then
        return true
      else
        return not context.in_treesitter_capture("comment")
          and not context.in_syntax_group("Comment")
      end
    end,
})

npairs.setup({
	check_ts = true, -- (also enabled in treesitter config)
	ts_config = {
        -- lua = {'string'},-- it will not add a pair on that treesitter node
        -- javascript = {'template_string'},
        -- java = false,-- don't check treesitter on java
    },
	fast_wrap = { -- can put closing pair in an existing line easily (M means meta which means alt key)
      map = '<M-e>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = [=[[%'%"%>%]%)%}%,]]=],
      end_key = '$',
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      check_comma = true,
      manual_position = true,
      highlight = 'Search',
      highlight_grey='Comment'
    }
})

-- insert `(` after select function or method item
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
