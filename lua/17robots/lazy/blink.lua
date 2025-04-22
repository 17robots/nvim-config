return {
  'saghen/blink.nvim',
  build = 'cargo build --release',
  keys = {
    -- {'<leader>x', '<cmd>BlinkTree  toggle-focus<cr>' }
  },
  lazy = false,
  opts = { tree = { enable = true }},
}
