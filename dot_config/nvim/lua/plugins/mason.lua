local M = {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "cssls",
      "omnisharp",
      "ts_ls",
      "csharp_ls",
      "copilot",
      "eslint",
      "lua_ls",
      "svelte",
      "html",
      "gopls",
      "emmet_ls",
      "sqlls",
      "astro",
      "tailwindcss",
      "basedpyright",
      "yamlls",
      "phpactor",
      "tinymist",
    },
  },
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        ensure_installed = {
          "cspell",
          "js-debug-adapter",
          "rust-analyzer",
          "prettierd",
          "oxlint",
          "oxfmt",
        },
      },
    },
    "neovim/nvim-lspconfig",
  },
}

return M
