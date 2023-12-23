local M = {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup {
      current_line_blame = true,
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        topdelete = { text = "‾" },
        untracked = { text = "│" },
      },
    }
  end,
}

return M
