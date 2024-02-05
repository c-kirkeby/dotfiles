local M = {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      local catppuccin = require "catppuccin"

      catppuccin.setup {
        transparent_background = true,
        fidget = true,
        gitsigns = true,
        cmp = true,
        indent_blankline = {
          enabled = true,
          scope_color = "",
          colored_indent_levels = true,
        },
        illuminate = {
          enabled = true,
          lsp = false,
        },
        telescope = {
          enabled = true,
        },
        lsp_trouble = false,
      }

      vim.opt.termguicolors = true
      vim.cmd.colorscheme "catppuccin-macchiato"
    end,
  },
}

return M
