
return {
	"nvimtools/none-ls.nvim",
    event = { "BufRead", "BufNewFile" },
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	keys = {
		{
			"<leader>nf",
			function()
				vim.lsp.buf.format({ async = true })
			end,
			desc = "Format file",
		},
	},
	opts = {
		sources = function()
			local null_ls = require("null-ls")
			return {
				-- Formatting sources
				null_ls.builtins.formatting.stylua,  -- Lua formatter
				null_ls.builtins.formatting.black.with({  -- Python formatter
					extra_args = { "--max-line-length=79" },  -- Enforce PEP8 line length
				}),
				null_ls.builtins.formatting.clang_format,  -- C/C++ formatter

				-- Linting sources (currently commented out)
				-- null_ls.builtins.diagnostics.ruff,
			}
		end,
	},
	config = function(_, opts)
		require("null-ls").setup({
			sources = opts.sources(),
		})
	end,
}

