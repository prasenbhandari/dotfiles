
return {
    {
        "williamboman/mason.nvim",
        event = { "BufRead", "BufNewFile" },
        opts = {},
        config = function(_, opts)
            require("mason").setup(opts)
        end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        event = { "BufRead", "BufNewFile" },
        opts = {
            ensure_installed = { "lua_ls", "clangd", "pyright" },
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
        end,
    },

    {
        "neovim/nvim-lspconfig",
		event = { 'BufRead', 'BufNewFile' },
        opts = {
            servers = {
                pyright = {},

                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" }, -- Recognize `vim` as a global to avoid warnings
                            },
                        },
                    },
                },

                clangd = {},
            },
        },
        config = function(_, opts)
            local lspconfig = require("lspconfig")
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
            for server, config in pairs(opts.servers) do
                lspconfig[server].setup(config)
				capabilities = capabilities
            end
        end,

		keys = function()
            return {
                { "K", vim.lsp.buf.hover, desc = "LSP Hover Documentation", mode = "n" }, -- Show hover documentation on `K`
                { "gd", vim.lsp.buf.definition, desc = "Go to definition", mode = "n" }, -- Go to definition on `gd`
                { "<leader>ca", vim.lsp.buf.code_action, desc = "LSP Code Action", mode = "n" }, -- Show code actions on `<leader>ca`
            }
        end,
    },
}
