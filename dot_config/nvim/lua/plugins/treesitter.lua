local opts = {
  ensure_installed = {
    -- Defaults
    "lua",
    "vim",
    -- Web Dev
    "html",
    "javascript",
    "typescript",
    "tsx",
    "json",
    "svelte",
    "vue",
    -- Other
    "rust",
    "bash",
    "c_sharp",
    "go"
  }
}

local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = opts
}

return M
