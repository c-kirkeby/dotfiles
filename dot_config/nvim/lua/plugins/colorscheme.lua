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
        fidget = true,
        gitsigns = true,
        indent_blankline = {
          enabled = true,
          scope_color = "",
          colored_indent_levels = true,
        },
      }

      vim.opt.termguicolors = true
      vim.cmd.colorscheme "catppuccin-macchiato"
    end,
  },
}

return M
