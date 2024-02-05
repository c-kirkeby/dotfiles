local M = {
  "mrcjkb/rustaceanvim",
  version = "^3",
  ft = { "rust" },
  dependencies = { "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp" },
  -- enabled = false,
  server = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = function(_, bufnr)
      -- local rustaceanvim = require "rustaceanvim"
      local opts = { noremap = true, silent = true }
      opts.buffer = bufnr

      opts.desc = "Show LSP references"
      -- with Telescope
      -- vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
      --
      -- opts.desc = "Go to definition"
      -- vim.keymap.set("n", "gd", rustaceanvim.goto_definition, opts)
      --
      -- opts.desc = "LSP Hover"
      -- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      --
      -- opts.desc = "LSP Signature Help"
      -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
      --
      opts.desc = "Code Actions"
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    end,
    tools = {
      hover_actions = {
        auto_focus = true,
      },
    },
  },
}

return M
