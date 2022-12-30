require'telescope'.setup {
    defaults = {
        mappings = {
	    i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
	    }
	}
    }
}

pcall(require'telescope'.load_extension, 'fzf')

builtin = require'telescope.builtin'
themes = require'telescope.themes'
vim.keymap.set('n', '<leader>?', function() builtin.oldfiles(themes.get_dropdown { winblend = 10, previewer = false}) end, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', function() builtin.buffers(themes.get_dropdown { winblend = 10, previewer = false}) end, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>sf', function() builtin.find_files(themes.get_dropdown { winblend = 10, previewer = false}) end, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', function() builtin.help_tags(themes.get_dropdown { winblend = 10, previewer = false}) end, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', function() builtin.grep_string(themes.get_dropdown { winblend = 10, previewer = false}) end, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', function() builtin.live_grep(themes.get_dropdown { winblend = 10, previewer = false}) end, { desc = '[S]earch with [G]rep' })
vim.keymap.set('n', '<leader>sd', function() builtin.diagnostics(themes.get_dropdown { winblend = 10, previewer = false}) end, { desc = '[S]earch [D]iagnostics' })
