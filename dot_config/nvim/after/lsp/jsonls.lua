---@diagnostic disable: missing-fields, inject-field

---@type vim.lsp.ClientConfig
local M = {
  settings = {
    json = {
      validate = { enable = true },
    },
  },
  before_init = function(_, config)
    config.settings.json.schemas = require("schemastore").json.schemas()
  end,
}

return M
