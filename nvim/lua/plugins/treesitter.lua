
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufRead", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "c", "cpp", "python", "hyprlang", "bash", "json", "vimdoc" },  -- list your languages here
      auto_install = true,  -- Automatically install missing parsers on startup

      highlight = {
        enable = true,                    -- enable tree-sitter based highlighting
        additional_vim_regex_highlighting = false,  -- disable regex-based highlighting for performance
      },

      indent = { enable = true },         -- enable tree-sitter based indentation

      -- Optional: Incremental selection allows you to expand/shrink the selection based on syntax nodes.
      -- incremental_selection = {
      --   enable = true,
      --   keymaps = {
      --     init_selection = "gnn",         -- start selection
      --     node_incremental = "grn",         -- expand to the upper node
      --     scope_incremental = "grc",        -- expand to the scope
      --     node_decremental = "grm",         -- shrink selection
      --   },
      -- },
      --
      -- -- Optional: Textobjects for better code navigation and manipulation.
      -- textobjects = {
      --   select = {
      --     enable = true,
      --     lookahead = true,  -- Automatically jump forward to textobj
      --     keymaps = {
      --       ["af"] = "@function.outer",  -- a function
      --       ["if"] = "@function.inner",  -- inner function
      --       ["ac"] = "@class.outer",     -- a class
      --       ["ic"] = "@class.inner",     -- inner class
      --     },
      --   },
      -- },
    })
  end,
}

