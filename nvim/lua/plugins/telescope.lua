return {
	-- Telescope core plugin
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			"nvim-lua/plenary.nvim",
			{"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
			"nvim-tree/nvim-web-devicons"
		},
		event = { 'BufRead', 'BufNewFile' },
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
			return {
				-- Define keybindings for common Telescope features
				{ "<leader>p", builtin.find_files, desc = "Find files with Telescope" },
				{ "<leader>f", builtin.live_grep, desc = "Live grep with Telescope" },
				{ "<leader>b", builtin.buffers, desc = "List buffers with Telescope" },
				{ "<leader>h", builtin.help_tags, desc = "Find help with Telescope" },
				{ "<leader>m", builtin.man_pages, desc = "Find man pages with Telescope" },
				{ "<leader>t", function() builtin.colorscheme({ enable_preview = true }) end, desc = "Preview colorschemes with Telescope" },
				{ "<leader>r", builtin.resume, desc = "Resume Telescope" },
			}
		end,
		config = function(_, opts)
			local telescope = require('telescope')
			telescope.setup(opts)
			telescope.load_extension('ui-select')
			telescope.load_extension('fzf')
			telescope.load_extension('file_browser')
		end
	},

	-- Install the UI select extension
	{
		'nvim-telescope/telescope-ui-select.nvim',
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		keys = {
			-- Enable hidden files in file browser
			{ "<leader>.", ":Telescope file_browser path=%:p:h hidden=true select_buffer=true<CR>", desc = "Open file browser with hidden files" }
		}
	}
}

