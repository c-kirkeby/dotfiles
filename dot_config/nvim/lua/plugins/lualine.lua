local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
  config = function()
    local trouble = require("trouble")
    require("lualine").setup({
      options = {
        theme = "auto",
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        sections = {
          lualine_x = {
            {
              "fileformat",
              icons_enabled = true,
              symbols = {
                unix = "LF",
                dos = "CRLF",
                mac = "CR",
              },
            },
          },
        },
      },
      disabled_filetypes = {
        { "neo-tree" },
      },
    })
  end,
}

return M
