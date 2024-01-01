local M = {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  -- lazy = true,
  --  ft = "markdown",
  -- event = {
  --   "BufReadPre " .. vim.fn.expand "~" .. "/vaults/personal/**.md",
  --   "BufNewFile " .. vim.fn.expand "~" .. "/vaults/personal/**.md",
  -- },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
      },
    },
  },
}

return M
