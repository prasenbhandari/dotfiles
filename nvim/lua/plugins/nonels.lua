
return {
    "nvimtools/none-ls.nvim",
	dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    opts = {
        sources = function()
            local none_ls = require("null-ls")

            return {
                -- Formatting sources
                none_ls.builtins.formatting.stylua,         -- Lua formatter
				none_ls.builtins.formatting.black.with({ -- Python formatter (autopep8)
                    extra_args = { "--max-line-length=79" }, -- Force PEP8 line length
                }),

                none_ls.builtins.formatting.clang_format,   -- C/C++ formatter

				-- Linting sources
				none_ls.builtins.diagnostics.ruff,
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
