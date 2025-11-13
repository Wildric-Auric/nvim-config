vim.api.nvim_create_autocmd("InsertEnter", { -- load only on start typing
  once = true,
  callback = function()
        local vimApiConfig = false
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        cmp.setup({
            snippet = {
              -- REQUIRED - you must specify a snippet engine
              expand = function(args)
                 require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
              end,
            },
            window = {
              -- completion = cmp.config.window.bordered(),
              -- documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
              ['<C-n>'] = cmp.mapping.select_next_item(),
              ['<C-p>'] = cmp.mapping.select_prev_item(),
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-y>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'luasnip' }, -- For luasnip users.
            }, {
              { name = 'buffer' },
            })
          })
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        if vimApiConfig
        then
        require('cmp').setup {
            sources = {
                {name = 'nvim_lua'}
            }
        }
        end
    --
  end,
})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'clangd', 'lua_ls','rust_analyzer', 'glsl_analyzer', 'pylsp'},
    automatic_enable = false,
})

local lspconf = vim.lsp

lspconf.config('glsl_analyzer', {
      capabilities = capabilities,
      filetypes = { 'glsl','vert', 'frag', 'tese', 'tesc', 'geom', 'comp' }
})
lspconf.enable('glsl_analyzer')

lspconf.config('lua_ls', {
  capabilities = capabilities,
  filetypes = { 'lua' },
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      workspace = {
        library = vim.tbl_flatten({
          vim.api.nvim_get_runtime_file("", true),
          vim.fn.expand("$VIMRUNTIME/lua"),
          vim.fn.stdpath("config") .. "/lua",
        }),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})
lspconf.enable('lua_ls')

lspconf.config('pylsp', {
      capabilities = capabilities,
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              ignore = {'W391', 'E302','E225', 'W291', 'E113', 'E112', 'E111', 'W293', 'E301'},
              --maxLineLength = 0
            }
          }
        }
      }
})
lspconf.enable('pylsp')

require("clangd_extensions").setup({})
lspconf.config('clangd', {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
    vim.keymap.set('n', '<A-u>', vim.cmd.ClangdSwitchSourceHeader)
        if client.server_capabilities.signatureHelpProvider then
             require('lsp-overloads').setup(client,
             {
                  keymaps = {
                  next_signature = "<C-j>",
                  previous_signature = "<C-k>",
                  next_parameter = "<C-l>",
                  previous_parameter = "<C-h>",
                  close_signature = "<Tab>"
                 }
             })
        end
    end,
    cmd = {
      "clangd",
      "--background-index",
      "--header-insertion=never"
    },
})
lspconf.enable('clangd')
lspconf.set_log_level("off")

local function Is_clang_active()
    local clients = vim.lsp.get_active_clients({ bufnr = 0 })
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
    
vim.keymap.set("n", "<leader>fi", function() Find_Impl(vim.fn.expand("<cword>")) end)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {});
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {});
vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float, {});

