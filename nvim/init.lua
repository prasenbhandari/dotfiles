-- Indentation settings
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true

-- Line numbers and relative numbers
vim.o.number = true
vim.o.relativenumber = true

-- Clipboard
vim.opt.clipboard = 'unnamedplus'

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

-- Enable true color support
vim.opt.termguicolors = true

-- Enable cursor line highlight
vim.opt.cursorline = true

vim.o.splitright = true
vim.o.splitbelow = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

require("config.lazy")

-- Setup window navigation with hjkl using Ctrl
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to top window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })
vim.keymap.set('n', "<leader>x",
	function ()
		vim.o.relativenumber = not vim.o.relativenumber
	end,
	{ desc = "Toggle Relative Number"}
)


-- if vim.g.vscode then
--     -- VSCode extension
-- else
--     -- ordinary Neovim
-- end

-- Setup theme 

vim.g.tokyonight_style = "night"
vim.cmd[[colorscheme tokyonight]]

vim.o.guifont = "JetBrainsMono Nerd Font"



vim.filetype.add({
	pattern = {
		[".*/dotfiles/hypr/.*%.conf"] = "hyprlang",
	},
})
