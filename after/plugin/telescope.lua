require('telescope').setup{
  defaults = {
    layout_config = {
      horizontal = {
        preview_width = 0.6,
        preview_cutoff = 0,
     },
      vertical = {
        preview_height = 0.57,
        preview_cutoff = 0,
      },
    },
    path_display    = {'filename_first'},
    layout_strategy = 'vertical'
  }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-space>', builtin.find_files, {})
--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fdf',
    function()
    builtin.find_files({cwd = vim.fn.input("Search Root: ")}) end, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fw', function()
	builtin.grep_string( { search = vim.fn.input("Grep > ") } ) end)
vim.keymap.set('n', '<leader>fcw', function()
	builtin.grep_string( { search = vim.fn.expand("<cword>") } ) end)
vim.keymap.set('n', '<leader>frw', function()
    builtin.grep_string( { search = vim.fn.input("Regex Grep > ")}, {use_regex=true}) end)
