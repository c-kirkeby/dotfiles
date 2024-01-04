-- General
vim.opt.clipboard = "unnamedplus"
-- vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.mouse = "a"

-- Tab Options
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- UI Config
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.showmode = false
vim.opt.colorcolumn = "79"
vim.opt.listchars = {
  space = "·",
  tab = " ",
}
vim.opt.list = true
-- vim.opt.termsync = false
vim.opt.signcolumn = "yes"

-- Searching
vim.opt.incsearch = true
vim.opt.hlsearch = true
