local builtin = require'telescope.builtin'
local themes = require'telescope.themes'
vim.keymap.set('n', '<leader>b', function() builtin.buffers(themes.get_dropdown { previewer = false}) end, { desc = 'Find existing [B]uffers' })
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Search [F]iles' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>/', function() builtin.grep_string({search = vim.fn.input("Grep >")}) end, { desc = 'Search with Grep' })
vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Search [H]elp Tags' })
