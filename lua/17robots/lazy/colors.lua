function color(c)
  c = c or 'gruvbuddy'
  vim.cmd.colorscheme(c)

  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

return {
  {
    'tjdevries/colorbuddy.nvim',
    config = function()
      color('gruvbuddy')

      local colorbuddy = require'colorbuddy'
      local c = colorbuddy.colors
      local Group = colorbuddy.Group
      local g = colorbuddy.groups
      local s = colorbuddy.styles

      Group.new("GoTestSuccess", c.green, nil, s.bold)
      Group.new("GoTestFail", c.red, nil, s.bold)

      Group.new("StatusLineError1", c.red:light():light(), g.Statusline)
      Group.new("StatusLineError2", c.red:light(), g.Statusline)
      Group.new("StatusLineError3", c.red, g.Statusline)
      Group.new("StatusLineError3", c.red:dark(), g.Statusline)
      Group.new("StatusLineError3", c.red:dark():dark(), g.Statusline)

      Group.new("WinSeparator", nil, nil)

      Group.new("LspParameter", nil, nil, s.italic)
      Group.new("LspDeprecated", nil, nil, s.strikethrough)

      Group.new("VirtNonText", c.gray3:dark(), nil, s.italic)

      Group.new("TreesitterContext", nil, g.Normal.bg:light())
      Group.new("TreesitterContextLineNumber", c.blue)

      Group.new("@punctuation.bracket.wrapper", c.gray3, nil, s.none)
      Group.new("@rapper_argument", c.red, nil, s.italic)
      Group.new("@rapper_return", c.orange:light(), nil, s.none)

      Group.new("@constructor.ocaml", c.orange:light(), nil, s.none)

      vim.cmd [[
        hi link @punctuation.bracket.rapper @text.literal
      ]]
    end
  }
}
