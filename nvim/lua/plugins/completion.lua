
return {
    {
        "github/copilot.vim",
        lazy = false,
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.api.nvim_set_keymap("i", "<S-Tab>", 'copilot#Accept("<CR>")', { expr = true, silent = true, noremap = true })
        end
    },
	{
		'L3MON4D3/LuaSnip',
		event = "InsertEnter",
		dependencies = {
			'saadparwaiz1/cmp_luasnip',
			'rafamadriz/friendly-snippets',
		}
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
            "zbirenbaum/copilot-cmp",
		},
		config = function()
			local cmp = require('cmp')
			local luasnip = require('luasnip')
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body) -- For LuaSnip
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered()
				},
				mapping = cmp.mapping.preset.insert({
					['<C-Space>'] = cmp.mapping.complete(),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                }),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
				}, {
					{ name = 'buffer' },
					{ name = 'path' },
				})
			})

		end
	}
}
