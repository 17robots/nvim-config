vim.pack.add{
  -- files
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/ibhagwan/fzf-lua',

  -- file explorer
  'https://github.com/nvim-mini/mini.files',

  'https://github.com/nvim-treesitter/nvim-treesitter',

  -- colorscheme
  -- 'https://github.com/EdenEast/nightfox.nvim',
  'https://github.com/ellisonleao/gruvbox.nvim',

  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/mfussenegger/nvim-dap',
  'https://github.com/jay-babu/mason-nvim-dap.nvim'
}
vim.g.mapleader = " "

local ensure_installed = { 'vimdoc', 'dyn', 'javascript', 'typescript', 'c', 'go', 'lua', 'rust', 'jsdoc', 'bash', 'zig', 'css' }
local group = vim.api.nvim_create_augroup('17robots', {})
local yank_group = vim.api.nvim_create_augroup('HighlightYank', {})

-- opts
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.autocomplete = true
vim.o.completeopt = 'menu,menuone,noselect,nearest'
vim.o.termguicolors = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.mouse = ''
vim.opt.mousemodel='extend'
vim.g.neovide_scale_factor = 0.70
vim.cmd[[colorscheme gruvbox]]

-- file explorer
require'mini.files'.setup{}

-- LSP
vim.diagnostic.config{ virtual_text = false, virtual_lines = { current_line = true } }
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
    end
  end
})

-- Treesitter
vim.filetype.add{ extension = { dyn = 'dyn' } }
vim.filetype.add { extension = { templ = 'templ' } }
vim.api.nvim_create_autocmd('User', {
  pattern = 'TSUpdate',
  callback = function()
  require'nvim-treesitter.parsers'.dyn = {
    install_info = {
      url = 'https://github.com/17robots/tree-sitter-dyn',
      branch = 'main',
      queries = 'neovim'
    }
  }
  end
})
require'nvim-treesitter'.install(ensure_installed)
vim.api.nvim_create_autocmd('FileType', { pattern = ensure_installed, callback = function() vim.treesitter.start() end, })

-- Mason
require'mason'.setup{}
require'mason-lspconfig'.setup{}
require'mason-nvim-dap'.setup{}

-- other
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end
})
vim.api.nvim_create_autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank {
      higroup = 'IncSearch',
      timeout = 40
    }
  end
})
vim.api.nvim_create_autocmd('BufWritePre', { group = group, pattern = '*', command = [[%s/\s\+$//e]] })

-- keymaps
vim.keymap.set('n', '<leader>f', function() require'fzf-lua'.files() end, {})
vim.keymap.set('n', '<leader>b', function() require'fzf-lua'.buffers() end, {})
vim.keymap.set('n', '<leader>d', function() require'fzf-lua'.diagnostics() end, {})
vim.keymap.set('n', '<leader>/', function() require'fzf-lua'.live_grep() end, {})
vim.keymap.set('n', '<leader>gd', function() require'fzf-lua'.lsp_definitions() end, {})
vim.keymap.set('n', '<leader>gD', function() require'fzf-lua'.lsp_declarations() end, {})
vim.keymap.set('n', '<leader>gr', function() require'fzf-lua'.lsp_references() end, {})
vim.keymap.set('n', '<leader>gI', function() require'fzf-lua'.lsp_implementations() end, {})
vim.keymap.set('n', '<leader>r', function() vim.lsp.buf.rename() end, {})
vim.keymap.set('n', '<leader>a', function() vim.lsp.buf.code_action() end, {})
vim.keymap.set('n', '<leader>x', function() MiniFiles.open() end, {})
vim.keymap.set({'n', 'v'}, 'gs', '^', {})
vim.keymap.set({'n', 'v'}, 'gl', '$', {})
vim.keymap.set('n', 'J', "mzJ`z", {})
vim.keymap.set('n', 'n', 'nzzzv', {})
vim.keymap.set('n', 'N', 'Nzzzv', {})
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["*y]])
vim.keymap.set('n', '<leader>Y', [["*Y]])
vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<leader>o', vim.lsp.buf.format)
vim.keymap.set('n', 'C', '<C-V>')
vim.keymap.set({'n', 'v'}, 'mm', '%')
vim.keymap.set('n', '<leader>w', [[<C-w>]])
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set('n', '<leader>t', function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd('J')
  vim.api.nvim_win_set_height(0, 15)
end)
vim.keymap.set('t', '<escape><escape>', '<c-\\><c-n>')
