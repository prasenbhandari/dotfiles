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

-- Always load lazy.nvim first
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Set leader keys before lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

vim.g.neovide_transparency = 0.8

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

vim.g.copilot_enabled = true

-- Function to Toggle Copilot
function ToggleCopilot()
    vim.g.copilot_enabled = not vim.g.copilot_enabled
    if vim.g.copilot_enabled then
        vim.notify("🔥 Copilot Enabled 🚀", vim.log.levels.INFO)
    else
        vim.notify("💀 Copilot Disabled 🧠", vim.log.levels.WARN)
    end
end

-- Keybinding to Toggle Copilot
vim.api.nvim_set_keymap("n", "<leader>cc", ":lua ToggleCopilot()<CR>", { noremap = true, silent = true })

if vim.g.vscode then
    vim.notify("🎮 Running in VSCode mode!", vim.log.levels.INFO)
    require("lazy").setup(require("vscode_config").plugins)
    require("vscode_config").setup()
else
    vim.notify("🚀 Running in regular Neovim mode!", vim.log.levels.INFO)
    require("config.lazy") -- Your plugins and full config
    vim.g.tokyonight_style = "night"
    vim.cmd[[colorscheme tokyonight]]
end

-- Setup theme 

vim.o.guifont = "JetBrainsMono Nerd Font"

vim.filetype.add({
	pattern = {
		[".*/dotfiles/hypr/.*%.conf"] = "hyprlang",
	},
})
