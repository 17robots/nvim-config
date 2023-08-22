local cmp = require'cmp'
local lspconfig = require'lspconfig'
local capabilities = require'cmp_nvim_lsp'.default_capabilities()

require'mason'.setup()
require'mason-lspconfig'.setup({
  ensure_installed = {"gopls", "tsserver" }
})

lspconfig.rust_analyzer.setup{ capabilities = capabilities }
lspconfig.pyright.setup{ capabilities = capabilities }
lspconfig.tsserver.setup{ capabilities = capabilities }
lspconfig.gopls.setup{ capabilities = capabilities }

cmp.setup({
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), 
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip' }
  }, {
    { name = 'buffer' }
  })
})

vim.keymap.set("n","<leader>d", vim.diagnostic.open_float)
vim.keymap.set("n","[d", vim.diagnostic.goto_next)
vim.keymap.set("n","]d", vim.diagnostic.goto_prev)
vim.keymap.set("n","<leader>q", vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }

    vim.keymap.set("n","gd",function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n","K",function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n","<leader>ws",function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n","<leader>ca",function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n","gr",function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n","<leader>r",function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i","<C-h>",function() vim.lsp.buf.signature_help() end, opts)
  end
})

vim.diagnostic.config({
  virtual_text = true
})


