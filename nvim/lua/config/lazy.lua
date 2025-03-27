-- Bootstrap lazy.nvim
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

-- Make sure to setup `mapleader` before lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Setup lazy.nvim with VSCode awareness
require("lazy").setup(
	vim.g.vscode and require("vscode_config").plugins or {
		-- Regular Neovim plugins
		{ import = "plugins" }
	},
	{
		defaults = {
			lazy = true,
		},
		clean = {
			confirm = true
		},
		install = { colorscheme = { "tokyonight" } },
		checker = { enabled = true },
		performance = {
			rtp = {
				disabled_plugins = {
					"netrw",
					"netrwPlugin",
					"netrwSettings",
					"netrwFileHandlers",
					"gzip",
					"matchit",
					"tarPlugin",
					"zipPlugin",
					"tutor",
				},
			},
		},
		ui = {
			border = "rounded",
			title = "Lazy.nvim Plugins 🚀"
		},
	}
)

-- Setup VSCode specific configuration if in VSCode mode
if vim.g.vscode then
	require("vscode_config").setup()
end

vim.notify("🔥 Lazy.nvim Loaded 🚀", vim.log.levels.INFO)
