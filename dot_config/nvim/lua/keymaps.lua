vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 3
vim.opt.cursorline = true

local opts = {
  noremap = true,
  silent = true,
}

-- Normal mode
-- Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "[b", "<cmd>bprevious<CR>", opts)
vim.keymap.set("n", "]b", "<cmd>bnext<CR>", opts)

-- Resizing
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Utility
vim.keymap.set("n", "<ESC>", "<cmd>noh<CR>", opts)

-- Terminal
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>", opts)
