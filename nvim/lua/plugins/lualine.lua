return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	event = "VimEnter",
	config = function()
		require("lualine").setup({
			options = {
				theme = 'powerline_dark',
			},
			sections = {
				lualine_x = {
                    function() return vim.g.copilot_enabled and "🤖 Copilot ON" or "💀 Copilot OFF" end,
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
						color = { fg = "#ff9e64" },
					},
				},
			},
		})
	end,
}
