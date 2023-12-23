local opts = {
  options = {
    theme = "auto",
    globalstatus = true,
  },
  disabled_filetypes = {
    { "neo-tree" },
  },
  sections = {
    lualine_a = { "mode" },
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
