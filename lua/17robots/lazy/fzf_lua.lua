return {
  'ibhagwan/fzf-lua',
  opts = {
    winopts = {
      preview = {
        vertical = 'up:65%',
        layout = 'vertical',
      },
    },
  },
  dependencies = { 'echasnovski/mini.icons' },
  keys = {
    { '<leader>f', function() require('fzf-lua').files() end },
    { '<leader>b', function() require('fzf-lua').buffers() end },
    { '<leader>/', function() require('fzf-lua').live_grep() end },
  },
}
