return {
    {
        'nvim-telescope/telescope.nvim',
        event = { 'BufRead', 'BufNewFile' },
        dependencies = {
            -- Core dependencies
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            "nvim-tree/nvim-web-devicons",

            -- Extensions (listed as dependencies)
            'nvim-telescope/telescope-ui-select.nvim',
            "nvim-telescope/telescope-file-browser.nvim",
        },
        opts = function()
            local actions = require('telescope.actions')
            return {
                defaults = {
                    prompt_prefix = "  ",
                    layout_strategy = "horizontal",
                    layout_config = {
                        horizontal = { width = 0.9, height = 0.8, prompt_position = "top" },
                    },
                    file_ignore_patterns = { "node_modules", ".git" },
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<Tab>"] = actions.select_tab,
                        },
                        n = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<Tab>"] = actions.select_tab,
                        },
                    },
                },
            }
        end,
        keys = function()
            local builtin = require("telescope.builtin")
            local fb = require("telescope").extensions.file_browser.file_browser
            return {
                { "<leader>p", builtin.find_files, desc = "Find files" },
                { "<leader>f", builtin.live_grep, desc = "Live grep" },
                { "<leader>b", builtin.buffers, desc = "List buffers" },
                { "<leader>h", builtin.help_tags, desc = "Find help" },
                { "<leader>m", builtin.man_pages, desc = "Find man pages" },
                { "<leader>t", function() builtin.colorscheme({ enable_preview = true }) end, desc = "Preview colorschemes" },
                { "<leader>r", builtin.resume, desc = "Resume Telescope" },
                -- Moved from the file_browser plugin definition
                { "<leader>.", function() fb({ path = "%:p:h", hidden = true, select_buffer = true }) end, desc = "File browser (hidden)" }
            }
        end,
        config = function(_, opts)
            local telescope = require('telescope')
            telescope.setup(opts)
            -- Load extensions
            telescope.load_extension('ui-select')
            telescope.load_extension('fzf')
            telescope.load_extension('file_browser')
        end
    },
}
