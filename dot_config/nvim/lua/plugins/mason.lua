local M = {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require "mason"
    local mason_lspconfig = require "mason-lspconfig"

    mason.setup {
      "cspell",
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
        "emmet_ls",
        --        "stylua",
        --        "goimports",
        --        "html-lsp",
        --        "json-lsp",
        "yamlls",
        "sqlls",
        "pyright",
      },
      automatic_installation = true,
    }
  end,
}

return M
