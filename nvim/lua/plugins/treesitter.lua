return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufRead", "BufNewFile" },
	config = function ()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "lua", "c", "cpp", "python" },
			highlight = { enable = true },
			indent = { enable = true }
		})
	end
}
