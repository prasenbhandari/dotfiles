return {
    {
        "saghen/blink.cmp",
        dependencies = {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        version = "*",
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                ["<Tab>"] = {
                    "snippet_forward",
                    function() -- sidekick next edit suggestion
                        return require("sidekick").nes_jump_or_apply()
                    end,
                    function()
                        return vim.lsp.inline_completion.get()
                    end,
                    "fallback",
                },
                ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
            },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer", "copilot" },
            },
        },
    },
}
