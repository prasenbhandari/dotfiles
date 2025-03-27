return {
    {
        "linux-cultist/venv-selector.nvim",
        branch = "regexp",
        opts = {},
        keys = {
            { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
            { "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Select Cached VirtualEnv" },
        },
    },
    {
		"linux-cultist/venv-selector.nvim",
		dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
		cmd = "VenvSelect", -- Load only when running :VenvSelect
		opts = {
			auto_refresh = true,  -- Auto-refresh venv list
			name = { "venv", ".venv", "env", ".env" }, -- Common venv names
		},
		config = function()
			require("venv-selector").setup()
			-- Automatically update python3_host_prog when venv changes
			vim.api.nvim_create_autocmd("User", {
				pattern = "VenvSelectChange",
				callback = function()
					local venv_path = vim.g["venv_selector_current"]
					if venv_path then
						vim.g.python3_host_prog = venv_path .. "/bin/python"
						print("Activated venv: " .. vim.g.python3_host_prog)
					end
				end
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		cond = true, -- Enable in both VSCode and regular Neovim
		opts = {
			check_ts = true,
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		cond = not vim.g.vscode, -- Only load in regular Neovim
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = false,
			},
			views = {
				cmdline_popup = {
					position = { row = 35, col = "50%" },
					size = { width = 60, height = "auto" },
				},
				popupmenu = {
					relative = "editor",
					position = { row = 8, col = "50%" },
					size = { width = 60, height = 10 },
					border = { style = "rounded", padding = { 0, 1 } },
					win_options = {
						winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
					},
				},
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		cond = true, -- Enable in both VSCode and regular Neovim
		version = "*",
		opts = {},
	},
}
