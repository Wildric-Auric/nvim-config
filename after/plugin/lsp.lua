local vimApiConfig = false--set to true only when you want to edit lua scripts for neovim then set to false


local lsp = require("lsp-zero")

local cmp = require('cmp')
local cmp_select = {behaviour = cmp.SelectBehavior.Select}

lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-CR>'] = cmp.mapping.confirm({select = true}),
	['<C-Space>'] = cmp.mapping.complete(),
})

if vimApiConfig
then
require('cmp').setup {
    sources = {
        {name = 'nvim_lua'}
    }
}
end

lsp.preset("recommended")
  require('mason').setup({})
  local mas = require 'mason-lspconfig'

  mas.setup({
    ensure_installed = {'clangd', 'lua_ls','rust_analyzer', 'glsl_analyzer', 'kotlin_language_server'},
    handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
   end,

    glsl_analyzer = function()
        require('lspconfig').glsl_analyzer.setup({
          filetypes = { 'glsl','vert', 'frag', 'tese', 'tesc', 'geom', 'comp' }
        })
    end,

    kotlin_language_server = function()
            require('lspconfig').kotlin_language_server.setup({
                --cmd = {"C:\\Program Files\\Android\\Android Studio\\jbr\\bin",},
                root_dir = require('lspconfig').util.root_pattern(
                "settings.gradle",
                "settings.gradle.kts",
                "build.gradle",
                "build.gradle.kts",
                "pom.xml",
                ".git"),
                filetypes = { 'kt', 'kts', 'kotlin'  }, -- Ensure Kotlin files are covered
            })
    end,

    lua_ls = function()
        require('lspconfig').lua_ls.setup({
          filetypes = { 'lua' };
          settings = {Lua ={diagnostics = {
                    globals = { 'vim' },
                },},
                workspace = {
                    library = {
                        vim.fn.expand("$VIMRUNTIME/lua"),
                        vim.fn.stdpath("config") .. "/lua",
                    },
                },
--              telemetry = { enable = false, },
            },
        })
    end,

    clangd = function()
      require('lspconfig').clangd.setup({
        on_attach = function(client, bufnr)
          vim.keymap.set('n', '<A-u>', vim.cmd.ClangdSwitchSourceHeader, { buffer = bufnr, desc = "Switch between so[u]rce / header" })
            if client.server_capabilities.signatureHelpProvider then
                 require('lsp-overloads').setup(client, { })
            end
        end,
        cmd = {
          "clangd",
          "--background-index",
          "--header-insertion=never"
        },
      })
    end,
    },
  })



lsp.set_preferences({
	sign_icons = { }
})

vim.lsp.set_log_level("off")

vim.keymap.set("n", "gd", vim.lsp.buf.definition, {});
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {});
vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float, {});
