local opts = {
  options = {
    theme = "catppuccin",
  },
}

local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
  config = function()
    require("lualine").setup(opts)
  end,
}

return M
