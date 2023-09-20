-- settings
vim.o.hlsearch = false
vim.opt.incsearch = false

vim.wo.number = true

vim.o.mouse = 'a'

vim.o.breakindent = true

vim.o.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.updatetime = 50
vim.wo.signcolumn = 'yes'
vim.opt.incsearch = false

vim.o.termguicolors = true

vim.o.completeopt = 'menuone,noselect'

vim.g.mapleader = ' '
vim.g.localleader = ' '

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.relativenumber = true
vim.opt.number = true

-- plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print(lazypath)
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require'lazy'.setup({
 'theprimeagen/harpoon',
 'xiyaowong/transparent.nvim',
 'mbbill/undotree',
 { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
 {
   'neovim/nvim-lspconfig',
   dependencies = { 
    {'williamboman/mason.nvim', config = true,},
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'rafamadriz/friendly-snippets'
   }
 },
 {'Soares/base16.nvim', config = function() vim.cmd'set background=dark' vim.cmd'colorscheme pop' end},
 {'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = {
    'nvim-lua/plenary.nvim',
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = function() return vim.fn.executable'make' == 1 end}
 }}
})

-- after (general)
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', "Y", "yg$")
vim.keymap.set('n', "J", "mzJ`z")
vim.keymap.set('n', "<C-d>", "<C-d>zz")
vim.keymap.set('n', "<C-u>", "<C-u>zz")
vim.keymap.set('n', "n", "nzzzv")
vim.keymap.set('n', "N", "Nzzzv")
vim.keymap.set('n', "<leader>y", "\"+y")
vim.keymap.set('n', "<leader>d", "\"_d")
vim.keymap.set('n', "Q", "<nop>")
vim.keymap.set('n', "<leader>x", vim.cmd.Lexplore)
vim.keymap.set('n', "ge", "G")
vim.keymap.set('n', "gs", "^")
vim.keymap.set('n', "gl", "$h")
vim.keymap.set('n', "<leader>w", "<C-w>")

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
    group = vim.api.nvim_create_augroup('YankHightlight', { clear = true }),
    pattern = '*',
})

-- after (harpoon)
local mark = require'harpoon.mark'
local ui = require'harpoon.ui'

vim.keymap.set("n", "<leader>ha", mark.add_file)
vim.keymap.set("n", "<leader>he", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>hh", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>hj", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>hk", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>hl", function() ui.nav_file(4) end)

-- after(lsp)
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
  pyright = {},
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

-- after (telescope)
local builtin = require'telescope.builtin'
local themes = require'telescope.themes'

require'telescope'.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  }
}
pcall(require'telescope'.load_extension, 'fzf')

vim.keymap.set('n', '<leader>b', function() builtin.buffers(themes.get_dropdown { previewer = false}) end, { desc = 'Find existing [B]uffers' })
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Search [F]iles' })
vim.keymap.set('n', '<leader>/', function() builtin.grep_string({search = vim.fn.input("Grep >")}) end, { desc = 'Search with Grep' })

-- after (treesitter)
require'nvim-treesitter.configs'.setup{
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript' },
  auto_install = false,
  highlight = { enable = true, additional_vim_regex_highlighting = true },
  indent = { enable = true, },
}

-- after (undotree)
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
