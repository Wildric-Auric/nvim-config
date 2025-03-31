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
    {"catppuccin/nvim", name = "catppuccin"},
    "rktjmp/lush.nvim",
    "metalelf0/jellybeans-nvim",
    "rebelot/kanagawa.nvim",
    "EdenEast/nightfox.nvim",
    "folke/tokyonight.nvim",
    --Parser, highlight
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
    },

    "nvim-treesitter/playground",

  --treeview
  {
    'nvim-tree/nvim-tree.lua',
    dependencies =  {'nvim-tree/nvim-web-devicons'},
    version = "*",
    lazy = false,
    config = function()
      require("nvim-tree").setup {}
    end,
  },

    --Fuzzy finder
    {'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' }},
    --LSP
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    'hrsh7th/cmp-nvim-lua',
    --Startup
    {'goolord/alpha-nvim'}

 }
)
