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

require("lazy").setup({
    --themes
    "rktjmp/lush.nvim",
    "EdenEast/nightfox.nvim",
    {"rose-pine/neovim", name = "rose-pine"},
    --Parser, highlight
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
    },

    "nvim-treesitter/playground",
    {'nvim-tree/nvim-web-devicons'},
  --treeview
    {"stevearc/oil.nvim"},
   --Navigation
   {'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' }},
   {"ThePrimeagen/harpoon", branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim" }},
   --LSP
   {'williamboman/mason.nvim'},
   {'williamboman/mason-lspconfig.nvim'},
   {'hrsh7th/cmp-nvim-lsp'},
   {'hrsh7th/nvim-cmp'},
   {'L3MON4D3/LuaSnip'},
   {'hrsh7th/cmp-nvim-lua'},
   {'Issafalcon/lsp-overloads.nvim'},
   {"p00f/clangd_extensions.nvim"},
   --Startup
   {'goolord/alpha-nvim'},
   --StatusLine
   {'nvim-lualine/lualine.nvim'},
   --HexEditor
   --Depends on xxd
   {'RaafatTurki/hex.nvim'}
}
)
