return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = "VimEnter",
    config = function()
        local config = require("lualine").get_config()

        config.options = {
            theme = 'tokyonight',
            icons_enabled = true,
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {
                statusline = { "dashboard" },
                winbar = {},
            },
        }

        table.insert(config.sections.lualine_x, 1, {
            function()
                return vim.g.copilot_enabled and "🤖" or "💀"
            end,
            tooltip = "Copilot Status",
        })

        table.insert(config.sections.lualine_x, 2, {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            color = { fg = "#ff9e64" },
        })

        require("lualine").setup(config)
    end,
}
