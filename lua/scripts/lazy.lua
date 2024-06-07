local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
 {
    --themes
    "ellisonleao/gruvbox.nvim",
    {"catppuccin/nvim", name = "catppuccin"},

    --Parser, highlight
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
    },

    "nvim-treesitter/playground",

    --Fuzzy finder
    {'nvim-telescope/telescope.nvim', tag = '0.1.6', dependencies = { 'nvim-lua/plenary.nvim' }},
  

    --Discord presence
    "andweeb/presence.nvim",

    --treeview
    {
      'nvim-tree/nvim-tree.lua',
      dependency =  {'nvim-tree/nvim-web-devicons'}, 
      version = "*",
      lazy = false,
      config = function()
        require("nvim-tree").setup {}
      end,
    },
    --LSP
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},

 }
)
