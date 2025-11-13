require("rose-pine").setup({
    variant = "auto", -- auto, main, moon, or dawn
    dark_variant = "main", -- main, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = true,
    enable = {
        terminal = true,
        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
        migrations = true, -- Handle deprecated options automatically
    },
    styles = {
        bold = true,
        italic = false,
        transparency = false,
    },
    groups = {
        border = "muted",
        link = "iris",
        panel = "surface",
        error = "love",
        hint = "iris",
        info = "foam",
        note = "pine",
        todo = "rose",
        warn = "gold",
        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",
        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
    },
    palette = {
        -- Override the builtin palette per variant
        moon = {
             base = '#18191a',
             overlay = '#363738',
         },
    },
})

require('nightfox').setup({
  palettes = {
    carbonfox = {
      blue = {
          base   = "#ff9050",
          bright = "#ffb275",
          dim    = "#cc7340",
      },
      green = {
          base   = "#ffd700",  -- gold
          bright = "#ffec70",  -- light yellow
          dim    = "#ccac00",  -- dark yellow
      },
    },
  },
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "zaibatsu",
  callback = function()
    vim.cmd([[
      hi! LazyNormal guibg=#151515 guifg=#d3c6aa
      hi! LazyBorder guibg=#151515 guifg=#45403d
    ]])
  end
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "zaibatsu",
  callback = function()
    vim.cmd([[
      hi! NormalFloat guibg=#151515 guifg=#d3c6aa
      hi! Pmenu guibg=#151515 guifg=#d3c6aa
      hi! PmenuSel guibg=#45403d guifg=#d3c6aa
      hi! PmenuSbar guibg=#252525 
      hi! PmenuThumb guibg=#656565 
    ]])
  end
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "zaibatsu",
  callback = function()
    vim.cmd([[
      hi! CmpItemAbbr guifg=#d3c6aa
      hi! CmpItemKind guifg=#d3c6aa
      hi! CmpItemMenu guifg=#d3c6aa
      hi! CmpItemAbbrMatch guifg=#d3c6aa
      hi! CmpItemAbbrMatchFuzzy guifg=#d3c6aa
    ]])
  end
})

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "zaibatsu",
  callback = function()
    vim.cmd([[
      hi! MatchParen guibg=#45403d guifg=#d3c6aa gui=bold
    ]])
  end
})


function FixEndBuff()
    local n = vim.api.nvim_get_hl(0, {name = "Normal"})
    if n == nil or n.bg == nil then return end
    local bg = string.format("#%06x", n.bg)
    vim.cmd("hi EndOfBuffer guibg=" .. bg)
end


vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = FixEndBuff
})

FixEndBuff()

--vim.api.nvim_create_autocmd("ColorScheme", {
--    pattern = "retrobox",
--  callback = function()
--    vim.cmd([[
--      hi! Normal guibg=#101010
--      hi! SignColumn guibg=#101010
--    ]])
--  end
--})


