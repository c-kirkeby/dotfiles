local opts = {}

local M = {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-context",
  },
  build = ":TSUpdate",
  config = function()
    local treesitter = require "nvim-treesitter.configs"
    local treesitter_context = require "treesitter-context"

    treesitter.setup {
      highlight = {
        enable = true,
      },
      auto_install = true,
      indent = { enable = true },
      ensure_installed = {
        -- Defaults
        "lua",
        "vim",
        -- Web Dev
        "jsdoc",
        "html",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "svelte",
        "vue",
        "php",
        -- Other
        "rust",
        "bash",
        "c_sharp",
        "go",
        "norg",
        "markdown",
        "markdown_inline",
        "astro",
      },
    }

    treesitter_context.setup {
      max_lines = 3,
    }

    local opts = { noremap = true, silent = true }

    vim.keymap.set("n", "[c", function()
      treesitter_context.go_to_context(vim.v.count1)
    end, opts)
  end,
}

return M
