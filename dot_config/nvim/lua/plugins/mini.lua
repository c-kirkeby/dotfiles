local M = {
  {
    "nvim-mini/mini.comment",
    version = false,
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    opts = {
      custom_commentstring = function()
        return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
      end,
      mappings = {
        comment_line = "<leader>/",
        comment_visual = "<leader>/",
      },
    },
  },
  {
    "nvim-mini/mini.pairs",
    version = false,
  },
  {
    "nvim-mini/mini.cursorword",
    version = false,
  },
}

return M
