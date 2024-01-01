local M = {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require "null-ls"

    local formatting = null_ls.builtins.formatting
    local lint = null_ls.builtins.diagnostics
    local completion = null_ls.builtins.completion
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local sources = {
      lint.eslint_d,
      -- lint.eslint,
      completion.spell,
      formatting.prettier.with {
        extra_filetypes = { "svelte", "json" },
      },
      formatting.gofmt,
      formatting.goimports,
      formatting.stylua,
    }

    local on_attach = function(client, bufnr)
      if client.supports_method "textDocument/formatting" then
        vim.api.nvim_clear_autocmds {
          group = augroup,
          buffer = bufnr,
        }
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format { bufnr = bufnr }
          end,
        })
      end
    end

    null_ls.setup {
      debug = true,
      sources = sources,
      on_attach = on_attach,
    }
  end,
}

return M
