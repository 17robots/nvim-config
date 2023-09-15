require'mason'.setup()
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message'})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message'})
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message'})
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic list'})

local on_attach = function(_, bufnr)
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, '[R]ename')
  vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, 'Code [A]ctions')
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  vim.keymap.set('n', 'gr', require'telescope.builtin'.lsp_references, '[G]oto [R]eferences')
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinitions')
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
end

local servers = {
  clangd = {},
  gopls = {},
  pyright = {},
  rust_analyzer = {},
  tsserver = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    }
  }
}

local cmp = require'cmp'
local luasnip = require'luasnip'
luasnip.config.setup{}
local mason_lsp = require'mason-lspconfig'
local capabilities = require'cmp_nvim_lsp'.default_capabilities(vim.lsp.protocol.make_client_capabilities())

mason_lsp.setup{ ensure_installed = vim.tbl_keys(servers)}
mason_lsp.setup_handlers{ function(server_name)
  require'lspconfig'[server_name].setup{
    capabilities = capabilities,
    on_attach = on_attach,
    settings = servers[server_name],
  }
end}

cmp.setup{
  snippet = { expand = function(args) luasnip.lsp_expand(args.body) end},
  mapping = cmp.mapping.preset.insert{
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true, }
  },
  sources = { { name = "nvim_lsp" }, { name = "luasnip" } }
}
