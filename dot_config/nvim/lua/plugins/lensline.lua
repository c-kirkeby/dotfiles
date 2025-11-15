local M = {
  "oribarilan/lensline.nvim",
  enabled = false,
  branch = "release/2.x",
  event = "LspAttach",
  config = function()
    require("lensline").setup()
  end,
}

return M
