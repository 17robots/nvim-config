return {
  'folke/snacks.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    explorer = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true, timeout = 3000 },
    picker = {
      enabled = true,
      sources = {
        explorer = {
          focus = 'list',
          auto_close = 'true'
        }
      }
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    { '<leader>f', function() Snacks.picker.smart() end, desc = 'Smart find files' },
    { '<leader>b', function() Snacks.picker.buffers() end, desc = 'Buffers' },
    { '<leader>/', function() Snacks.picker.grep() end, desc = 'Grep' },
    { '<leader>n', function() Snacks.picker.notifications() end, desc = 'Notification History' },
    { '<leader>x', function() Snacks.explorer() end, desc = 'File Explorer' },
    { '<leader>d', function() Snacks.picker.diagnostics() end, desc = 'File Explorer' },
    { 'gd', function() Snacks.picker.lsp_definitions() end, desc = 'Goto Definition' },
    { 'gD', function() Snacks.picker.lsp_declarations() end, desc = 'Goto Declaration' },
    { 'gr', function() Snacks.picker.lsp_references() end, desc = 'Goto References' },
    { 'gI', function() Snacks.picker.lsp_implementations() end, desc = 'Goto Implementations' },
    { '<leader>r', function() vim.lsp.buf.rename() end, desc = 'Rename Variable' },
    { '<leader>a', function() vim.lsp.buf.code_action() end, desc = 'Rename Variable' },
  }
}
