local M = {
  "wansmer/symbol-usage.nvim",
  enabled = false,
  event = "LspAttach",
  config = function()
    require("symbol-usage").setup()
  end,
}

return M
