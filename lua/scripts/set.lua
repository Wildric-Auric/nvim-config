
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.smartindent = false
vim.opt.cindent     = false
local indentValue 	= 4
vim.opt.tabstop 	= indentValue
vim.opt.softtabstop = indentValue
vim.opt.shiftwidth  = indentValue
vim.opt.expandtab   = true

vim.opt.wrap        = false

vim.opt.hlsearch    = false
vim.opt.incsearch   = true
vim.opt.termguicolors = true;

vim.opt.scrolloff   = 5
vim.opt.signcolumn  = "yes"
vim.opt.isfname:append("@-@")
vim.updatetime = 50
vim.opt.colorcolumn = "0"

vim.g.mapleader = " "
