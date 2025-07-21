return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = { 'MunifTanjim/nui.nvim' },
  opts = {
    lsp = {
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      }
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = false,
    },
    cmdline = {
      view = "cmdline_popup",
    },
    views = {
      cmdline_popup = {
        relative = "editor",
        position = { row = "50%", col = "50%" },
        size = { width = "auto", height = "auto" },
        border = {
          style = "rounded",
          padding = { 1, 2 },
        },
      },
    },
    routes = {
      {
        filter = { event = "Cmdline" },
      },
    },
  },
  config = function(_, opts)
    if vim.o.filetype == 'lazy' then
      vim.cmd[[messages clear]]
    end
    require'noice'.setup(opts)
  end
}
