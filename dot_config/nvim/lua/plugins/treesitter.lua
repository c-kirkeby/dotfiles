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
      indent = { enable = true },
      ensure_installed = {
        -- Defaults
        "lua",
        "vim",
        -- Web Dev
        "html",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "svelte",
        "vue",
        -- Other
        "rust",
        "bash",
        "c_sharp",
        "go",
        "norg",
      },
    }
  end,
}

return M
