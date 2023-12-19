local opts = {
  disable_netrw = true,
  filters = {
    dotfiles = false,
  },
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
  },
}

local M = {
  enabled = false,
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup(opts)
    local api = require "nvim-tree.api"

    vim.keymap.set("n", "<C-n>", api.tree.toggle)
  end,
}

return M
