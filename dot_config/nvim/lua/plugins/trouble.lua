local M = {
  "folke/trouble.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = { use_diagnostic_signs = true },
  keys = {
    { "<leader>xx", "<cmd>TroubleToggle<cr>",                     { desc = "Trouble toggle" } },
    { "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", { desc = "Trouble lsp workspace diagnostics" } },
    { "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>",  { desc = "Trouble lsp document diagnostics" } },
    { "<leader>xl", "<cmd>Trouble loclist<cr>",                   { desc = "Trouble loclist" } },
    { "<leader>xq", "<cmd>Trouble quickfix<cr>",                  { desc = "Trouble quickfix" } },
    { "gR",         "<cmd>Trouble lsp_references<cr>",            { desc = "Trouble lsp references" } },
  },
}

return M
