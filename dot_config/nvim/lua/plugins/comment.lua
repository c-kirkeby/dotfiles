local M = {
  "numToStr/Comment.nvim",
  lazy = false,
  keys = {
    { "gcc", mode = "n", desc = "Comment toggle current line" },
    { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
    { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
    { "gbc", mode = "n", desc = "Comment toggle current block" },
    { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
    { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
  },
  config = function()
    local comment = require "Comment"
    local comment_api = require "Comment.api"

    comment.setup {}
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
