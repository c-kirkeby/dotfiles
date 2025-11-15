local configs = {
  eslint_d = {
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "svelte",
    },
    root_pattern = {
      ".eslintrc",
      ".eslintrc.js",
      ".eslintrc.cjs",
      ".eslintrc.yml",
      ".eslintrc.json",
      "eslint.config.js",
      "eslint.config.mjs",
      "eslint.config.ts",
      "eslint.config.mts",
      "eslint.config.cts",
    },
  },
}

local M = {
  "mfussenegger/nvim-lint",
  enabled = false,
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
    }
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function(args)
        local filetype = vim.bo[args.buf].filetype
        local bufname = vim.api.nvim_buf_get_name(args.buf)
        local names = {}

        for linter, config in pairs(configs) do
          if vim.tbl_contains(config.ft, filetype) then
            local root_pattern = require("lspconfig.util").root_pattern(unpack(config.root_pattern))
            if root_pattern(bufname) then
              table.insert(names, linter)
            end
          end
        end

        if #names > 0 then
          lint.try_lint(names)
        end
      end,
    })
  end,
}

return M
