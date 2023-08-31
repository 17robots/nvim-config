vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', "Y", "yg$")
vim.keymap.set('n', "J", "mzJ`z")
vim.keymap.set('n', "<C-d>", "<C-d>zz")
vim.keymap.set('n', "<C-u>", "<C-u>zz")
vim.keymap.set('n', "n", "nzzzv")
vim.keymap.set('n', "N", "Nzzzv")
vim.keymap.set('n', "<leader>y", "\"+y")
vim.keymap.set('n', "<leader>d", "\"_d")
vim.keymap.set('n', "Q", "<nop>")
vim.keymap.set('n', "<leader>x", vim.cmd.Ex)
vim.keymap.set('n', "ge", "G")
vim.keymap.set('n', "gs", "^")
vim.keymap.set('n', "gl", "$h")

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
    group = vim.api.nvim_create_augroup('YankHightlight', { clear = true }),
    pattern = '*',
})

