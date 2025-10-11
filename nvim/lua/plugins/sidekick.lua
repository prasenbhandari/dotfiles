return {
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",
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
					function() -- if you are using Neovim's native inline completions
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
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
	},
	{
		"folke/sidekick.nvim",
		opts = {
			-- add any options here
			cli = {
				mux = {
					backend = "zellij",
					enabled = false,
				},
			},
		},
		-- stylua: ignore
		keys = {
			{
				"<leader>aa",
				function() require("sidekick.cli").toggle() end,
				desc = "Sidekick Toggle CLI",
			},
			{
				"<leader>as",
				function() require("sidekick.cli").select() end,
				desc = "Select CLI",
			},
			{
				"<leader>at",
				function() require("sidekick.cli").send({ msg = "{this}" }) end,
				mode = { "x", "n" },
				desc = "Send This",
			},
			{
				"<leader>av",
				function() require("sidekick.cli").send({ msg = "{selection}" }) end,
				mode = { "x" },
				desc = "Send Visual Selection",
			},
			{
				"<leader>ap",
				function() require("sidekick.cli").prompt() end,
				mode = { "n", "x" },
				desc = "Sidekick Select Prompt",
			},
			{
				"<c-.>",
				function() require("sidekick.cli").focus() end,
				mode = { "n", "x", "i", "t" },
				desc = "Sidekick Switch Focus",
			},
		},
	}
}
