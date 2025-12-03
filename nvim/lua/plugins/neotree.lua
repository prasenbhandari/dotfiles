return {
	"nvim-neo-tree/neo-tree.nvim",
    dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
	opts = {
		filesystem = {
			filtered_items = {
				--visible = true,
				hide_dotfiles = false,
			},
			follow_current_file = {
				enabled = true,
				leave_dirs_open = false
			},
			hijack_netrw_behavior = "open_current",
		},

		window = {
			position = "float",
			border = "rounded",
			popup = {
				size = { height = 0.8, width = 0.6 },
				position = { row = "50%", col = "50%" },
			},
			mappings = {
				["<Tab>"] = "open",
				["<cr>"] = "open",
			}
		}
	},

	keys = {
		{"<leader>e", "<cmd>Neotree toggle<cr>", desc = "Neotree"},
	}

}
