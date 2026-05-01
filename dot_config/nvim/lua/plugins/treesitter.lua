local M = {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-context",
  },
  lazy = false,
  build = ":TSUpdate",
  branch = "main",
  config = function()
    local parsers = {
      -- Defaults
      "lua",
      "vim",
      -- Web Dev
      "jsdoc",
      "html",
      "javascript",
      "typescript",
      "tsx",
      "json",
      "svelte",
      "vue",
      "php",
      -- Other
      "rust",
      "bash",
      "c_sharp",
      "go",
      "markdown",
      "markdown_inline",
      "astro",
    }

    local treesitter_context = require("treesitter-context")
    require("nvim-treesitter").install(parsers)

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local buf, filetype = args.buf, args.match

        local language = vim.treesitter.language.get_lang(filetype)
        if not language then
          return
        end

        -- check if parser exists and load it
        if not vim.treesitter.language.add(language) then
          return
        end

        -- enables syntax highlighting and other treesitter features
        vim.treesitter.start(buf, language)

        -- enables treesitter based indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

        treesitter_context.setup({
          max_lines = 3,
        })
        local opts = { noremap = true, silent = true }

        vim.keymap.set("n", "[c", function()
          treesitter_context.go_to_context(vim.v.count1)
        end, opts)
      end,
    })
  end,
}

return M
