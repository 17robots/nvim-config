return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    animate = { enabled = true },
    dashboard = {enabled = false},
    dim = {enabled = true},
    explorer = {},
    input = {enabled = true},
    notifier = {enabled = true},
    picker = {enabled = true},
    scope = {
      enabled = true,
      treesitter = {
        enable = true,
      }
    },
    scratch = {enabled = false},
    scroll = {enabled = true},
    words = {enabled = false},
  },
  keys = {
    { '<leader>x', function() Snacks.explorer() end },
    { '<leader>f', function() Snacks.picker.files() end },
    { '<leader>b', function() Snacks.picker.buffers() end },
    { '<leader>/', function() Snacks.picker.grep() end },
    { '<leader>t', function() Snacks.terminal.open() end },
  },
}
