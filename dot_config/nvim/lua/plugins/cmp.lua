local M = {
  "Saghen/blink.cmp",
  dependencies = {
    { "L3MON4D3/LuaSnip", version = "v2.*" },
    "rafamadriz/friendly-snippets",
    "folke/lazydev.nvim",
    { "danymat/neogen",   dependencies = { "nvim-treesitter/nvim-treesitter" }, config = true, version = "*" },
  },

  version = "*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    snippets = { preset = "luasnip" },
    keymap = { preset = "default" },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
      },
    },
    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },
  },
  opts_extend = { "sources.default" },
}

return M
