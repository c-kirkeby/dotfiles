-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
-- local on_attach = function(client, bufnr)
--   local opts = { noremap = true, silent = true }
--   opts.buffer = bufnr
--
--   opts.desc = "Show LSP references"
--   vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
--
--   opts.desc = "Go to definition"
--   vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--
--   opts.desc = "LSP Hover"
--   vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--
--   opts.desc = "Code Actions"
--   vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
--   -- Set up additional on_attach
-- end

local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    --  "hrsh7th/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
      "j-hui/fidget.nvim",
      opts = {
        notification = {
          window = {
            winblend = 0,
          },
        },
      },
    },
    "folke/neodev.nvim",
    "jose-elias-alvarez/null-ls.nvim",
  },
  config = function()
    local lspconfig = require "lspconfig"
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      opts.desc = "Show LSP references"
      vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

      opts.desc = "Go to definition"
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

      opts.desc = "LSP Hover"
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

      opts.desc = "LSP Signature Help"
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

      opts.desc = "Code Actions"
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
      -- Set up additional on_attac>
    end

    local signs = { Error = " ", Warn = " ", Hint = "󰌵", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Language servers with default settings
    local servers = {
      --      "cspell",
      "emmet_ls",
      "yamlls",
      "jsonls",
      "html",
      "cssls",
      "tsserver",
      "eslint",
      "sqlls",
      "tailwindcss",
      -- "intelephense",
      "phpactor",
    }

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end

    -- Language Servers with non-default settings

    lspconfig["lua_ls"].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
            [vim.fn.stdpath "config" .. "/lua"] = true,
          },
        },
      },
    }

    lspconfig.svelte.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "svelte" },
      root_dir = lspconfig.util.root_pattern "package.json",
    }

    lspconfig.omnisharp.setup {
      -- cmd = { "omnisharp", "--languageserver", "stdio" },
      cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
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
  end,
}

return M
