vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")

vim.schedule(function()
	vim.opt.clipboard = 'unnamedplus'
end)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")

-- Setup window navigation with hjkl using Ctrl
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to top window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- Setup theme 
vim.cmd('colorscheme tokyonight-night')

