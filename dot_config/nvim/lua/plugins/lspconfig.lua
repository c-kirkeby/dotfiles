local M = {
  'neovim/nvim-lspconfig',
  dependencies = {
    --  "hrsh7th/nvim-lspconfig",
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    'folke/neodev.nvim',
    "jose-elias-alvarez/null-ls.nvim",
  },
  config = function()
    local lspconfig = require('lspconfig')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    local capabilities = cmp_nvim_lsp.default_capabilities()
    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      opts.desc = "Show LSP references"
      vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
      -- Set up additional on_attach
    end

    -- Language servers with default settings
    local servers = {
      --      "cspell",
      "html",
      "cssls",
      "tsserver",
      "eslint",
      "omnisharp",
      "sqlls"
    }

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities
      }
    end

    -- Language Servers with non-default settings

    lspconfig["lua_ls"].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          },
          workspace = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true
          }
        }
      }
    }

    lspconfig.svelte.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "svelte" },
      root_dir = lspconfig.util.root_pattern "package.json",
    }

    lspconfig.omnisharp.setup {
      cmd = { "omnisharp", "--languageserver", "stdio" },
      on_attach = on_attach,
      capabilities = capabilities,
    }

    lspconfig.gopls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
        },
      },
    }
  end
}

return M
