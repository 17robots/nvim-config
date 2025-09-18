return {
  'echasnovski/mini.files',
  config = function()
    require'mini.files'.setup{
      options = {
        use_as_default_explorer = true
      }
    }
  end,
  keys = {
    { '<leader>x', function() MiniFiles.open() end },
  },
}

