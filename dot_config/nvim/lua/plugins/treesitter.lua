local opts = {}

local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local treesitter = require "nvim-treesitter.configs"

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
      },
    }
  end,
}

return M
