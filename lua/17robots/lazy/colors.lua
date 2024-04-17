function color(c)
  c = c or 'vesper'
  vim.cmd.colorscheme(c)

  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

return {
  {
    'datsfilipe/vesper.nvim',
    config = function()
      require'vesper'.setup {
        transparent = true,
        italics = {
          comments = true,
          keywords = true,
          functions = true,
          strings = true,
          variables = true,
        }
      }

      color('vesper')
    end
  }
}
