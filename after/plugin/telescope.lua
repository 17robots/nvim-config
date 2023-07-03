require'telescope'.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
	    },
    }
  }
}

pcall(require'telescope'.load_extension, 'fzf')

local builtin = require'telescope.builtin'
local themes = require'telescope.themes'
vim.keymap.set('n', '<leader>?', function() builtin.keymaps(themes.get_ivy { previewer = false}) end, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>b', function() builtin.buffers(themes.get_dropdown { previewer = false}) end, { desc = 'Find existing [B]uffers' })
vim.keymap.set('n', '<leader>f', function() builtin.find_files(themes.get_dropdown { previewer = true}) end, { desc = 'Search [F]iles' })
vim.keymap.set('n', '<leader>h', function() builtin.help_tags(themes.get_dropdown { previewer = false}) end, { desc = 'Search [H]elp' })
vim.keymap.set('n', '<leader>/', function() builtin.live_grep(themes.get_dropdown { previewer = true}) end, { desc = 'Search with Grep' })
vim.keymap.set('n', '<leader>d', function() builtin.diagnostics(themes.get_dropdown { previewer = false}) end, { desc = 'Search Diagnostics' })
vim.keymap.set('n', '<leader>c', function() builtin.commands(themes.get_ivy { previewer = false}) end, { desc = '[C]ommands' })
