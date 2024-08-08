local lsp = require("lsp-zero")

lsp.preset("recommended")
  require('mason').setup({})
  require('mason-lspconfig').setup({
    -- Replace the language servers listed here 
    -- with the ones you want to install
    ensure_installed = {'tsserver', 'clangd', 'lua_ls','rust_analyzer'},
    handlers = {
      function(server_name)
        require('lspconfig')[server_name].setup({})
      end,


     clangd = function()
      require('lspconfig').clangd.setup({
        on_attach = function(_, bufnr)
          vim.keymap.set('n', '<A-u>', vim.cmd.ClangdSwitchSourceHeader, { buffer = bufnr, desc = "Switch between so[u]rce / header" })
        end,
        cmd = {
          "clangd",
          "--background-index",
          "--header-insertion=never"
        },
      })
    end
    

    },
  })

local cmp = require('cmp')
local cmp_select = {behaviour = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-CR>'] = cmp.mapping.confirm({select = true}),
	['<C-Space>'] = cmp.mapping.complete(),
})


lsp.set_preferences({
	sign_icons = { }
})


vim.keymap.set("n", "gd", vim.lsp.buf.definition, {});
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {});
