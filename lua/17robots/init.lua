require"17robots.set"
require"17robots.remap"
require"17robots.lazy_init"

local augroup = vim.api.nvim_create_augroup
local group = augroup('17robots', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
  require'plenary.reload'.reload_module(name)
end

vim.filetype.add{
  extension = {
    templ = 'templ'
  }
}

autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank{
      higroup = 'IncSearch',
      timeout = 40
    }
  end
})

autocmd('BufWritePre', {
  group = group,
  pattern = '*',
  command = [[%s/\s\+$//e]]
})

autocmd('LspAttach', {
  group = group,
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '<leader>i', require'telescope.builtin'.diagnostics, { desc = 'Search d[I]agnostics' })
    vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
