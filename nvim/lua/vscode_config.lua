-- VSCode Neovim specific configuration
local M = {}

-- VSCode-compatible plugins specification
M.plugins = {
	-- Motion Plugins
	{
		"ggandor/leap.nvim",
		dependencies = { "tpope/vim-repeat" },
		config = function()
			require("leap").create_default_mappings()
		end,
	},
	{
		"ggandor/flit.nvim",
		dependencies = { "ggandor/leap.nvim" },
		opts = {},
	},
	-- Text Objects and Manipulation
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		opts = {},
	},
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {},
	},
	{
		"echasnovski/mini.move",
		event = "VeryLazy",
		opts = {},
	},
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		version = "*",
		opts = {},
	},
	-- Enhanced increment/decrement
	{
		"monaqa/dial.nvim",
		event = "VeryLazy",
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
					augend.constant.alias.bool,
					augend.semver.alias.semver,
				},
			})
			vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal())
			vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal())
			vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual())
			vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual())
		end,
	},
	-- Yank history
	{
		"gbprod/yanky.nvim",
		event = "VeryLazy",
		opts = {
			highlight = { timer = 250 },
		},
		keys = {
			{ "y", "<Plug>(YankyYank)", mode = { "n", "x" } },
			{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" } },
			{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" } },
			{ "[y", "<Plug>(YankyCycleForward)" },
			{ "]y", "<Plug>(YankyCycleBackward)" },
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			check_ts = true,
		},
	},
}

-- VSCode specific keymaps
local function setup_keymaps()
	-- Use VSCode easymotion when available
	vim.keymap.set('n', '<Leader>j', '<Cmd>call VSCodeNotify("vim-easymotion.jumpCursor")<CR>', { silent = true })

	-- Better Navigation
	vim.keymap.set('n', 'gh', '<Cmd>call VSCodeNotify("editor.action.showHover")<CR>')
	vim.keymap.set('n', 'gd', '<Cmd>call VSCodeNotify("editor.action.revealDefinition")<CR>')
	vim.keymap.set('n', 'gr', '<Cmd>call VSCodeNotify("editor.action.goToReferences")<CR>')

	-- Comments
	vim.keymap.set('x', 'gc', '<Plug>VSCodeCommentary', {})
	vim.keymap.set('n', 'gc', '<Plug>VSCodeCommentary', {})
	vim.keymap.set('o', 'gc', '<Plug>VSCodeCommentary', {})
	vim.keymap.set('n', 'gcc', '<Plug>VSCodeCommentaryLine', {})

	-- Folding
	vim.keymap.set('n', 'za', '<Cmd>call VSCodeNotify("editor.toggleFold")<CR>')
	vim.keymap.set('n', 'zR', '<Cmd>call VSCodeNotify("editor.unfoldAll")<CR>')
	vim.keymap.set('n', 'zM', '<Cmd>call VSCodeNotify("editor.foldAll")<CR>')

	-- Search
	vim.keymap.set('n', '<leader>f', '<Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>')
	vim.keymap.set('n', '<leader>F', '<Cmd>call VSCodeNotify("workbench.action.findInFiles")<CR>')
end

-- VSCode specific settings
local function setup_options()
	vim.opt.hlsearch = false  -- VSCode handles search highlighting
	vim.opt.clipboard = "unnamedplus"    -- Let VSCode handle clipboard
end

-- Initialize everything
function M.setup()
	vim.notify("🔥 VSCode-Neovim config loaded!", vim.log.levels.INFO)
	setup_keymaps()
	setup_options()
end

return M
