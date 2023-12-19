local M = {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require "mason"
    local mason_lspconfig = require "mason-lspconfig"

    mason.setup {
      ensure_installed = {
        "css",
        "omnisharp",
        "jsonls",
        --        "rust-analyzer",
        "typescript-language-server",
        --        "rustfmt",
        "eslint_d",
        "lua-language-server",
        "prettier",
        "svelte",
        "html",
        "gopls",
        "goimports",
      },
    }

    mason_lspconfig.setup {
      ensure_installed = {
        "cssls",
        "omnisharp",
        "tsserver",
        "eslint",
        "lua_ls",
        "svelte",
        "html",
        "gopls",
      },
      automatic_installation = true,
    }
  end,
}

return M
