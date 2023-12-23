local M = {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    cmp = true,
    config = function()
      local catppuccin = require "catppuccin"

      catppuccin.setup {
        transparent_background = true,
      }

      vim.opt.termguicolors = true
      vim.cmd.colorscheme "catppuccin-macchiato"
    end,
  },
}

return M
