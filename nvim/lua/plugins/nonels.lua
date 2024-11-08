
return {
    "nvimtools/none-ls.nvim",
    opts = {
        sources = function()
            local none_ls = require("null-ls")

            return {
                -- Formatting sources
                none_ls.builtins.formatting.stylua,         -- Lua formatter
                none_ls.builtins.formatting.black,          -- Python formatter
                none_ls.builtins.formatting.clang_format,   -- C/C++ formatter
            }
        end,
    },
    config = function(_, opts)
        require("null-ls").setup({
            sources = opts.sources(),
        })

        -- Keybinding to format the current buffer
        vim.keymap.set('n', '<leader>gf', function()
            vim.lsp.buf.format({ async = true })
        end, { desc = "Format file" })
    end,
}
