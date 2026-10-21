local font_size     = 20
local font_name     = "CaskaydiaMono Nerd Font Mono"

local function setFont()
    vim.o.guifont = font_name .. ":h" .. font_size
end

if vim.g.neovide then
    setFont()
    vim.g.neovide_cursor_trail_size       = 0.0
    vim.g.neovide_scroll_animation_length = 0.0
    vim.g.neovide_position_animation_length = 0.15
end


vim.keymap.set('n', '<C-S-z>',
function()
    font_size = font_size + 1
    setFont()
end, { noremap = true, silent = true })

vim.keymap.set('n', '<C-S-u>',
function()
    font_size = font_size - 1
    setFont()
end, { noremap = true, silent = true })
