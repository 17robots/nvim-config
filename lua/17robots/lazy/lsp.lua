return {
  'mason-org/mason-lspconfig.nvim',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'neovim/nvim-lspconfig',
    {
      'saghen/blink.cmp',
      opts = {
        keymap = {
          preset = 'default',
          ['<CR>'] = { 'select_and_accept' }
        }
      },
    },
  },
  opts = {},
}
