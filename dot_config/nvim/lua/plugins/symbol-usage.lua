local function text_format(symbol)
  local fragments = {}

  -- Indicator that shows if there are any other symbols in the same line
  local stacked_functions = symbol.stacked_count > 0 and (" | +%s"):format(symbol.stacked_count) or ""

  if symbol.references then
    local usage = symbol.references == 1 and "reference" or "references"
    local num = symbol.references == 0 and "no" or symbol.references
    table.insert(fragments, ("%s %s"):format(num, usage))
  end

  if symbol.definition then
    table.insert(fragments, symbol.definition .. "definitions")
  end

  if symbol.implementation then
    table.insert(fragments, symbol.implementation .. "implementations")
  end

  return table.concat(fragments, " ") .. stacked_functions
end

local M = {
  "wansmer/symbol-usage.nvim",
  event = "LspAttach",
  config = function(opts)
    require("symbol-usage").setup({
      filetypes = opts.filetypes,
      log = opts.log,
      text_format = text_format,
    })
  end,
}

return M
