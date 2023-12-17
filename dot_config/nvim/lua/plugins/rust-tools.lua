local M = {
  "simrat39/rust-tools.nvim",
  ft = "rust",
  dependencies = "neovim/nvim-lspconfig",
  config = function()
    local rust_tools = require "rust-tools"
    rust_tools.setup {
      server = {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<C-Space>", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
          vim.keymap.set("n", "<Leader>a", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
        end,
      },
    }
  end,
  tools = {
    hover_actions = {
      auto_focus = true,
    },
  },
}

return M
