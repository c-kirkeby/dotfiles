local M = {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup {
      current_line_blame = true,
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        topdelete = { text = "‾" },
        untracked = { text = "│" },
      },
      on_attach = function(bufnr)
        local gitsigns = package.loaded.gitsigns

        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map("n", "]h", gitsigns.next_hunk, "Next Hunk")
        map("n", "[h", gitsigns.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", gitsigns.stage_hunk, "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", gitsigns.reset_hunk, "Reset Hunk")
        map("n", "<leader>ghp", gitsigns.preview_hunk, "Preview Hunk")
      end,
    }
  end,
}

return M
