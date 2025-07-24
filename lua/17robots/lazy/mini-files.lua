return {
  'echasnovski/mini.files',
  config = function()
    require'mini.files'.setup()
  end,
  keys = {
    { '<leader>x', function() MiniFiles.open() end },
  },
}

