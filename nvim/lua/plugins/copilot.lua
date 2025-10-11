return {
	{
		"github/copilot.vim",
		lazy = false,
		config = function()
			vim.g.copilot_no_tab_map = true
			vim.api.nvim_set_keymap("i", "<S-Tab>", 'copilot#Accept("<CR>")', { expr = true, silent = true, noremap = true })
		end
	},
	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "github/copilot.vim" },
		config = function()
			require("copilot_cmp").setup()
		end
	}
}
