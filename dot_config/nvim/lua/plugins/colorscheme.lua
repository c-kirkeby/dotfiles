local M = {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      ---@module "catppuccin"
      local catppuccin = require("catppuccin")

      vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      vim.fn.sign_define(
        "DapBreakpointCondition",
        { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
      )
      vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

      catppuccin.setup({
        auto_integrations = true,
        flavour = "macchiato",
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
}

return M
