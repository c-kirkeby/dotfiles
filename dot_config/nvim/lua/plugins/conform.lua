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
      ["biome-check"] = {
        cwd = root_file({
          "biome.json",
          "biome.jsonc",
        }),
      },
      -- prettierd = {
      --   cwd = root_file({
      --     -- https://prettier.io/docs/en/configuration.html
      --     ".prettierrc",
      --     ".prettierrc.json",
      --     ".prettierrc.yml",
      --     ".prettierrc.yaml",
      --     ".prettierrc.json5",
      --     ".prettierrc.js",
      --     ".prettierrc.cjs",
      --     ".prettierrc.mjs",
      --     ".prettierrc.toml",
      --     "prettier.config.js",
      --     "prettier.config.cjs",
      --     "prettier.config.mjs",
      --   }),
      -- },
      oxfmt = {
        command = "vp", -- use vp cli
        args = { "fmt", "--write", "$FILENAME" }, -- provide explicit flags from open buffer into --write
        stdin = false,
        cwd = root_file({ ".oxfmtrc.json", ".oxfmtrc.jsonc" }),
        require_cwd = true,
      },
    },
    formatters_by_ft = {
      lua = { "stylua" },
      go = { "gofmt", "goimports" },
      cs = { "csharpier" },
      -- javacript = { "prettierd" },
      typescript = {
        -- "prettierd",
        "oxfmt",
      },
      typescriptreact = {
        -- "prettierd",
        "oxfmt",
      },
      json = {
        -- "prettierd"
      },
      jsonc = {
        -- "prettierd"
      },
      -- svelte = { "prettierd" },
      astro = {
        -- "prettierd",
        "oxfmt",
      },
    },
    format_on_save = {
      timeout_ms = 5000,
      lsp_format = "fallback",
    },
  },
}

return M
