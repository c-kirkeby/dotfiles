local M = {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "cssls",
      "omnisharp",
      "ts_ls",
      -- "copilot", -- enable once inline completion is available in 0.12
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
          "prettierd",
        },
      },
    },
    "neovim/nvim-lspconfig",
  },
}

return M
