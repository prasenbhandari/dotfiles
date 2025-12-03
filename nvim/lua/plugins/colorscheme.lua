return {
	-- Add multiple themes here
	{
        "folke/tokyonight.nvim",
		lazy = false,
        priority = 1000,
        config = function()
            vim.g.tokyonight_style = "night"
            vim.cmd.colorscheme "tokyonight"
        end
	},
	{
        "catppuccin/nvim", name = "catppuccin",
		lazy = true,
	},
	{
        "shaunsingh/nord.nvim",
		lazy = true,
	},
	{
        "navarasu/onedark.nvim",
		lazy = true,
	},
	{
        "dracula/vim", as = "dracula",
		lazy = true,
	},
	{
        "sainnhe/everforest",
		lazy = true,
	},
	{
        "sainnhe/sonokai",
		lazy = true,
	},
	{
        "morhetz/gruvbox",
		lazy = true,
	},
	{
        "rebelot/kanagawa.nvim",
		lazy = true,
	},
	{
		"marko-cerovac/material.nvim",
		lazy = true
	}
}
