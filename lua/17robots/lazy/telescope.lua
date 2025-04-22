return {
  'nvim-telescope/telescope.nvim',

  tag = '0.1.5',

  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    require 'telescope'.setup {}

    local builtin = require 'telescope.builtin'
    -- vim.keymap.set('n', '<leader>b', builtin.buffers, {})
    -- vim.keymap.set('n', '<leader>f', builtin.find_files, {})
    vim.keymap.set('n', '<leader>i', builtin.diagnostics, {})
    vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
    -- vim.keymap.set('n', '<leader>/', function()
    --  builtin.grep_string({ search = vim.fn.input("Grep > ") })
    -- end)
  end
}
