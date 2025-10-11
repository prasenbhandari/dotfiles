return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			local ensure_installed = { "lua_ls", "clangd", "pyright", "hyprls" }

			require("mason-lspconfig").setup({
				ensure_installed = ensure_installed,
			})

			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			local servers = {
				pyright = {},
				clangd = {},
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
						},
					},
				},
				hyprls = {},
			}

			for name, config in pairs(servers) do
				-- Configure the server with the provided options
				vim.lsp.config(name, vim.tbl_deep_extend("force", {
					capabilities = capabilities,
				}, config))
				-- Enable the server
				vim.lsp.enable(name)
			end

			-- Keybindings
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
		end,
	},
}
