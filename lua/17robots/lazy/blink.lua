return {
  'saghen/blink.nvim',
  build = 'cargo build --release',
  keys = {
    {'leaderx', '<cmd>BlinkTree  toggle-focus<cr>' }
  },
  lazy = false,
  opts = { tree = { enable = true }},
}
