return {
	-- Telescope core plugin
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = function()
			local actions = require('telescope.actions')
			return {
				defaults = {
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
						},
						n = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
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
				{ "<leader>t", function() builtin.colorscheme({ enable_preview = true }) end, desc = "Preview colorschemes with Telescope" }
			}
		end,
		config = function(_, opts)
			require('telescope').setup(opts)
			-- Load the `ui-select` extension after setting up Telescope
			require('telescope').load_extension('ui-select')
		end
	},

	-- Install the UI select extension
	{
		'nvim-telescope/telescope-ui-select.nvim',
	}
}

