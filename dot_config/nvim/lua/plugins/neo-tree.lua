local opts = {
  default_component_configs = {
    icon = {
      folder_open = "",
      folder_closed = "",
    },
    filesystem = {
      visible = true,
    },
    git_status = {
      symbols = {
        added = "",
        modified = "",
        deleted = "D",
        renamed = "R",
        untracked = "U",
        ignored = " ",
        unstaged = "M",
        staged = "M",
      },
    },
  },
}

local M = {
  enabled = false,
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup(opts)

    vim.keymap.set("n", "<C-n>", ":Neotree toggle position=right<CR>", { noremap = true, silent = true })
  end,
}

return M
