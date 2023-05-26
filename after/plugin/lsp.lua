local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then desc = 'LSP: ' .. desc end
	vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>r', vim.lsp.buf.rename, '[R]e[N]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require'telescope.builtin'.lsp_references, '[G]oto [R]eferences')
    nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>k', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', require'telescope.builtin'.lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require'telescope.builtin'.lsp_workspace_symbols, '[W]orkspace [S]ymbols')
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<c-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        if vim.lsp.buf.format then vim.lsp.buf.format() elseif vim.lsp.buf.formatting then vim.lsp.buf.formatting() end
    end, { desc = 'Format current buffer'})
end

local servers = { 'rust_analyzer', 'pyright', 'tsserver', 'gopls' }
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require'cmp_nvim_lsp'.default_capabilities(capabilities)
for _, lsp in ipairs(servers) do require'lspconfig'[lsp].setup { on_attach = on_attach, capabilities = capabilities } end
require'mason'.setup()
require'mason-lspconfig'.setup { ensure_installed = servers }
require'null-ls'.setup()
require'mason-null-ls'.setup { automatic_setup = true, handlers = {} }

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local luasnip = require'luasnip'
local cmp = require'cmp'

cmp.setup {
  snippet = {
      expand = function(args) luasnip.lsp_expand(args.body) end
  },
  mapping = cmp.mapping.preset.insert {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
      ['<Tab>'] = cmp.mapping(function(fallback) if cmp.visible() then cmp.select_next_item() elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump() else fallback() end end, {'i', 's'}),
      ['<S-Tab>'] = cmp.mapping(function(fallback) if cmp.visible() then cmp.select_prev_item() elseif luasnip.jumpable(-1) then luasnip.jump(-1) else fallback() end end, {'i', 's'}),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'null_ls' },
  }
}
