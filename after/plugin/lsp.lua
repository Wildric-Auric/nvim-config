require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'clangd', 'lua_ls','rust_analyzer', 'glsl_analyzer'},
    automatic_enable = true,
})

vim.lsp.config('glsl_analyzer', {
      filetypes = { 'glsl','vert', 'frag', 'tese', 'tesc', 'geom', 'comp' }
})

vim.lsp.config['lua_ls'] = {
  filetypes = { 'lua' },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT'},
      diagnostics = { globals = { 'vim' } },
      workspace = {
        library = {
          vim.api.nvim_get_runtime_file("", true),
          vim.fn.expand("$VIMRUNTIME/lua"),
          vim.fn.stdpath("config") .. "/lua",
        },
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
}

vim.lsp.config('pylsp', {
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              ignore = {
                    'W391', 'E303','E302','E225','W291',
                    'E113','E112','E111','W293','E301',
                    'E501','E305','E261','E701','W202'
                    },
              enabled = false
            },
            jedi = {
                extra_paths = {vim.fn.expand('~/prg/artha/ArthaSim/content/assets/scripts/_internal')}
            }
          }
        }
      }
})

------------------------ c/cpp, clang utilities ------------------------
require("clangd_extensions").setup({})
require("lsp-overloads").setup({
  -- UI options — mostly match vim.lsp.util.open_floating_preview
  ui = {
    border = "single",        -- border style: "none","single","double","rounded","solid","shadow"
    height = nil,             -- nil = auto-size
    width = nil,              -- nil = auto-size
    wrap = true,
    wrap_at = nil,
    max_width = nil,
    max_height = nil,
    close_events = { "CursorMoved", "BufHidden", "InsertLeave" },
    focusable = true,
    focus = false,
    offset_x = 0,
    offset_y = 0,
    silent = true,            -- suppress "No signature help" messages
    floating_window_above_cur_line = false,
    zindex = 50,              -- z-index of the floating window
  },
  keymaps = {
    next_signature     = "<C-j>",
    previous_signature = "<C-k>",
    next_parameter     = "<C-l>",
    previous_parameter = "<C-h>",
    close_signature    = "<Tab>",
  },
  display_automatically    = true,  -- show popup on trigger characters automatically
  override_native_handler  = true,  -- replace vim.lsp.handlers["textDocument/signatureHelp"]
  log_level                = "warn",
})

--------------------------------------------------------------------------------

vim.lsp.config('kotlin_language_server', {
       root_markers = { "settings.gradle",
            "build.gradle.kts",
            "build.gradle",
            "settings.gradle.kts",
            "pom.xml",
            "settings.gradle",
            ".git",
        },
        filetypes = { 'kotlin'  },
})

local function Is_clang_active()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    for _, client in ipairs(clients) do
      if client.name == "clangd" then
            return true
      end
    end
    return false
end
local function Find_Impl(token)
    if Is_clang_active() == false then
        return
    end
    if string.len(token) < 1 then
        return
    end
    local builtin = require('telescope.builtin')
    builtin.grep_string( { search = "::" .. token .. "("} )
end

-----------------------------native lsp params----------------------
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    -- if client:supports_method('textDocument/implementation') then
      -- Create a keymap for vim.lsp.buf.implementation ...
    --end
    if client:supports_method('textDocument/completion') then
        vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = false})
    end
  end,
})
vim.opt.autocomplete = false
vim.lsp.log.set_level("off")
--vim.g.matchup_matchparen_enabled = 2
vim.opt.completeopt  = {'menuone', 'noselect'}
vim.o.pumborder      = 'single'
vim.opt.complete:append('o')

------------------------------keymaps-------------------------------
vim.keymap.set('n', '<leader>td',
function()
    local config = vim.diagnostic.config().virtual_text
    if (config == nil or config == false) then
        vim.diagnostic.config({virtual_text = {severity = vim.diagnostic.severity.ERROR}})
    else
        vim.diagnostic.config({virtual_text = false})
    end
end,
{ desc = 'Toggle diagnostics virtual lines/text'}
)

vim.keymap.set('i', '<C-n>',
function()
    vim.lsp.completion.get()
end,
    { desc = 'Trigger autocomplete'}
)

vim.diagnostic.config({virtual_text = {severity = vim.diagnostic.severity.ERROR}})

vim.keymap.set('n', '<A-u>', vim.cmd.ClangdSwitchSourceHeader)
vim.keymap.set("n", "<leader>fi", function() Find_Impl(vim.fn.expand("<cword>")) end)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float, {})
