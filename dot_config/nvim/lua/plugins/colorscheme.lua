local M = {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      --- @module "catppuccin"
      local catppuccin = require("catppuccin")

      catppuccin.setup({
        flavour = "macchiato",
        transparent_background = false,
        integrations = {
          fidget = true,
          gitsigns = true,
          blink_cmp = true,
          snacks = {
            enabled = true,
            indent_scope_color = "",
          },
          illuminate = {
            enabled = true,
            lsp = false,
          },
          telescope = {
            enabled = true,
          },
          lsp_trouble = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
              ok = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
              ok = { "underline" },
            },
            inlay_hints = {
              background = true,
            },
          },
          which_key = {
            enabled = true,
          },
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
}

return M
