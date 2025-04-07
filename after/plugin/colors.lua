require("catppuccin").setup({
    flavour = {"auto", "latte", "frappe", "macchiato", "mocha"},
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = true, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {
    },
    custom_highlights = {
        --Normal = { bg = "#1e001c" },
    },
    default_integrations = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = false,            -- enable undercurls
    commentStyle = { italic = false},
    functionStyle = {},
    keywordStyle = { italic = false},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {ui = {bg_gutter = "none"} } },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
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

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "retrobox",
  callback = function()
    vim.cmd([[
      hi! Normal guibg=#101010
      hi! SignColumn guibg=#101010
    ]])
  end
})


