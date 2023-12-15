local opts = {
  options = { 
    theme = 'auto'
  }
}

local M = {
  "nvim-lualine/lualine.nvim",
  config = function() 
    require('lualine').setup(opts)
  end
}

return M
