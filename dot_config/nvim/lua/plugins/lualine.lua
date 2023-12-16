local opts = {
  options = {
    theme = 'catppuccin'
  }
}

local M = {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup(opts)
  end
}

return M
