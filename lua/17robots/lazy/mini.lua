return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    require'mini.files'.setup{ options = { use_as_default_explorer = true }}
    require'mini.icons'.setup()
    require'mini.pick'.setup()
    require'mini.notify'.setup()
    require'mini.git'.setup()
    require'mini.bufremove'.setup()
    require'mini.snippets'.setup()
    require'mini.completion'.setup()
    require'mini.extra'.setup()
  end,
  keys = {
    { '<leader>x', function() MiniFiles.open() end },
    { '<leader>f', function() MiniPick.builtin.files() end },
    { '<leader>b', function() MiniPick.builtin.buffers() end },
    { '<leader>/', function() MiniPick.builtin.grep_live() end },
  }
}
