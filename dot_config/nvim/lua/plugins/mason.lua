local M = {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ensure_installed = {
        "cspell",
        "prettierd",
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "cssls",
        "omnisharp",
        "ts_ls",
        "eslint",
        "lua_ls",
        "svelte",
        "html",
        "gopls",
        "emmet_ls",
        "yamlls",
        "sqlls",
        "astro",
        "tailwindcss",
        "basedpyright",
      },
      automatic_installation = true,
    })
  end,
}

return M
