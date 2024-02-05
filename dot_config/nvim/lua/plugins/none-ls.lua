local M = {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require "null-ls"

    local formatting = null_ls.builtins.formatting
    local code_actions = null_ls.builtins.code_actions
    local diagnostics = null_ls.builtins.diagnostics
    local completion = null_ls.builtins.completion
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local sources = {
      diagnostics.eslint,
      code_actions.eslint,
      code_actions.gitsigns,
      -- completion.spell,
      -- diagnostics.cspell.with {
      --   condition = function(utils)
      --     return utils.root_has_file { ".cspell.json", "cspell.json" }
      --   end,
      -- },
      diagnostics.cspell,
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
            vim.lsp.buf.format { bufnr = bufnr, timeout_ms = 2000 }
          end,
        })
      end
    end

    null_ls.setup {
      --      debug = true,
      sources = sources,
      on_attach = on_attach,
    }
  end,
}

return M
