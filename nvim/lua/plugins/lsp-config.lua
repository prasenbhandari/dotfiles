return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = true,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufRead", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim", -- Make sure this is a dependency
        },
        config = function()
            local on_attach = function(client, bufnr)
                local bufmap = vim.keymap.set
                bufmap("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP Hover" })
                bufmap("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to Definition" })
                bufmap("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action" })
            end

            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            vim.lsp.config('*', {
                on_attach = on_attach,
                capabilities = capabilities,
            })

            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = { diagnostics = { globals = { "vim" } } },
                }
            })

        end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                -- A list of servers to ensure are installed
                ensure_installed = { "lua_ls", "clangd", "pyright", "hyprls" },
                automatic_installation = true, -- Renamed from 'automatic_setup'
            })
        end
    },
}
