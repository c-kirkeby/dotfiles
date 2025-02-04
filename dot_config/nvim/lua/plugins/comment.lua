local M = {
  "numToStr/Comment.nvim",
  enabled = vim.fn.has "nvim-0.9.5" == 1,
  dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
  lazy = false,
  keys = {
    { "gcc", mode = "n",          desc = "Comment toggle current line" },
    { "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
    { "gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
    { "gbc", mode = "n",          desc = "Comment toggle current block" },
    { "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
    { "gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" },
  },
  config = function()
    local comment = require "Comment"
    local comment_api = require "Comment.api"

    comment.setup {
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    }
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>/", comment_api.toggle.linewise.current, opts)
    vim.keymap.set(
      "v",
      "<leader>/",
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      opts
    )
  end,
}

return M
