local M = {
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/cmp-buffer'},
	{'hrsh7th/cmp-path'},
	{'hrsh7th/cmp-cmdline'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
	{'saadparwaiz1/cmp_luasnip'},
	{'hrsh7th/nvim-cmp',
		config = function()
			local cmp = require('cmp')
			cmp.setup({
				snippet = {
					expand = function(args)
						-- 以下插件作为前提：
						-- { 'L3MON4D3/LuaSnip' },
						-- { 'saadparwaiz1/cmp_luasnip' },
						require('luasnip').lsp_expand(args.body)
					end,
				},
				sources = cmp.config.sources(
					{
    				{ name = 'nvim_lsp' },
    				-- 以下插件作为前提：
    				-- { 'L3MON4D3/LuaSnip' },
    				-- { 'saadparwaiz1/cmp_luasnip' },
    				{ name = 'luasnip' },
					},
    				{
    					{ name = 'buffer' },
						{ name = 'path' }
    				}
				),
				mapping = {
    				-- 上一个
    				['<C-p>'] = cmp.mapping.select_prev_item(),
    				-- 下一个
    				['<C-n>'] = cmp.mapping.select_next_item(),
    				-- 出现补全
    				['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    				-- 取消
    				['<A-,>'] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
    				}),
    				-- 确认
    				-- Accept currently selected item. If none selected, `select` first item.
    				-- Set `select` to `false` to only confirm explicitly selected items.
    				['<c-f>'] = cmp.mapping.confirm({
					select = true,
    				behavior = cmp.ConfirmBehavior.Replace
    				}),
    				-- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    				['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    				['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
				}
			})
		end
	},
}
return M
