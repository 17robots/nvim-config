return {
  'saghen/blink.cmp',
  event = 'VimEnter',
  build = 'cargo build --release',
  dependencies = { 'L3MON4D3/LuaSnip' },
  opts = {
    keymap = { preset = 'default' },
    appearance = { nerd_font_variant = 'mono' },
    completion = { documentation = { auto_show = true, auto_show_delay_ms = 50 } },
    sources = { default = { 'lsp', 'path', 'snippets' }, },
    snippets = { preset = 'luasnip' },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    signature = { enabled = true }
  },
}
