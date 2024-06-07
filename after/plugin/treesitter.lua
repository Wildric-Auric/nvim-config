
require'nvim-treesitter.configs'.setup {
    ensure_installed = {}, --"lua","c","cpp","rust","markdown"
    sync_install = false,
    auto_install = true,
    ignore_install = { },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
}

require 'nvim-treesitter.install'.compilers = {"clang" }