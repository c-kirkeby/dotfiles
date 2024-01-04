local M = {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
      -- highlights = require("catppuccin.groups.integrations.bufferline").get(),
    },
  },
  -- config = function(opts)
  --   require("bufferline").setup(opts)
  -- end,
}

return M
