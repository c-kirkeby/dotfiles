---@param files string|string[]
---@return fun(self: conform.FormatterConfig, ctx: conform.Context): nil|string
local root_file = function(files)
  return function(self, ctx)
    return vim.fs.root(ctx.dirname, files)
  end
end

local M = {
  "stevearc/conform.nvim",
  opts = {
    default_format_opts = { lsp_format = "fallback" },
    formatters = {
      prettierd = {
        cwd = root_file({
          -- https://prettier.io/docs/en/configuration.html
          ".prettierrc",
          ".prettierrc.json",
          ".prettierrc.yml",
          ".prettierrc.yaml",
          ".prettierrc.json5",
          ".prettierrc.js",
          ".prettierrc.cjs",
          ".prettierrc.mjs",
          ".prettierrc.toml",
          "prettier.config.js",
          "prettier.config.cjs",
          "prettier.config.mjs",
        }),
      },
    },
    formatters_by_ft = {
      lua = { "stylua" },
      go = { "gofmt", "goimports" },
      cs = { "csharpier" },
      javacript = { "prettierd" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      json = { "prettierd" },
      jsonc = { "prettierd" },
      svelte = { "prettierd" },
      astro = { "prettierd" },
    },
    format_on_save = {
      timeout_ms = 5000,
      lsp_format = "fallback",
    },
  },
}

return M
