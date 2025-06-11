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
      format = {
        -- keep your existing formats (optional)
        cmdline = { icon = "", lang = "bash" },
      },
    },
    -- Enable the popupmenu view
    popupmenu = {
      enabled = true,
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

      popupmenu = {
        relative = "editor",
        position = {
          row = "50%+1",
          col = "50%",
        },
        size = {
          width = "auto",
          height = "auto",
          max_width = 80,
          max_height = 10,
        },
        border = {
          style = "rounded",
        },
        -- anchor by the north edge so it grows downward
        anchor = "N",
        win_options = {
          winblend = 10,
        },
      },
    },

    -- route all cmdline messages through the popup
    routes = {
      {
        -- view = "cmdline_popup",
        filter = { event = "Cmdline" },
      },
      {
        -- view = "popupmenu",
        filter = { event = "complete_changed" },
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
