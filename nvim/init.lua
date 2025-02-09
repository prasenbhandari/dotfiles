vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")

vim.schedule(function()
	vim.opt.clipboard = 'unnamedplus'
end)

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


if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
end

-- Setup theme 
vim.g.material_style = "deep ocean"
vim.cmd('colorscheme material')
vim.o.guifont = "Jetbrains Mono"
vim.o.relativenumber = true

vim.filetype.add({
	pattern = {
		[".*/dotfiles/hypr/.*%.conf"] = "hyprlang",
	},
})
