--vim.opt.runtimepath:append("/home/wildric/.local/share/nvim/site/")
require'nvim-treesitter.install'.compilers = {"clang"}
require'nvim-treesitter'.setup {
    ensure_installed = {"lua","c","cpp","rust","markdown"},
    sync_install = false,
    auto_install = true,
    ignore_install = { },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {enable = false}
}
