local M = {
  "goolord/alpha-nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local config = require("alpha.themes.dashboard").config
    require("alpha").setup(config)
  end,
}

return M
