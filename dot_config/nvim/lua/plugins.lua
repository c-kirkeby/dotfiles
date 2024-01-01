local M = {
  {
    "folke/which-key.nvim",
    opts = {},
  },
  {
    "github/copilot.vim",
    event = "InsertEnter",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
}

return M
