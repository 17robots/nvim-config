return {
  'saghen/blink.cmp',
  event = 'VimEnter',
  build = 'cargo build --release',
  dependencies = { 'L3MON4D3/LuaSnip' },
  opts = {
    keymap = { preset = 'enter' },
    appearance = { nerd_font_variant = 'mono' },
    completion = { documentation = { auto_show = true, auto_show_delay_ms = 50 }, },
    sources = { default = { 'lsp', 'path', 'snippets' }, },
    snippets = { preset = 'luasnip' },
    fuzzy = { implementation = 'prefer_rust' },
    signature = { enabled = true }
  },
}
