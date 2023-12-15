local M = {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      vim.cmd.colorscheme "catppuccin-macchiato"
    end
  }
}

return M
