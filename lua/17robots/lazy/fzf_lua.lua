return {
  'ibhagwan/fzf-lua',
  opts = {
    winopts = {
      preview = {
        layout = 'horizontal',
        horizontal = 'right:70%',
        wrap = true,
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
