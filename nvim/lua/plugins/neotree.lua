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
		},

		window = {
			mappings = {
				["<Tab>"] = "open",
				["<cr>"] = "open",
			}
		}
	},

	keys = {
		{"<leader>nt", "<cmd>Neotree toggle<cr>", desc = "Neotree"},
	}

}
