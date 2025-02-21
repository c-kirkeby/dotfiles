local M = {
  "mrcjkb/rustaceanvim",
  version = "^4",
  ft = { "rust" },
  dependencies = { "neovim/nvim-lspconfig", "sahgen/blink.cmp" },
  opts = {
    server = {
      on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true }
        opts.buffer = bufnr

        opts.desc = "Show LSP references"
        vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to definition"
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

        opts.desc = "Go to declaration"
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Go to type definition"
        vim.keymap.set("n", "<leader>lD", vim.lsp.buf.type_definition, opts)

        opts.desc = "LSP Hover"
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "LSP Signature Help"
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

        opts.desc = "Code Actions"
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
      end,
    },
  },
  config = function(_, opts)
    vim.g.rustaceanvim = vim.tbl_extend("force", {}, opts or {})
  end,
}

return M
