local opts = {
  defaults = {
    prompt_prefix = "  ",
    selection_caret = "  ",
    entry_prefix = "  ",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
      },
      vertical = {
        mirror = false
      }
    }
  }
}

local M = {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    { 'nvim-lua/plenary.nvim' }
  },
  config = function()
    require("telescope").setup(opts)
    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  end
}

return M
