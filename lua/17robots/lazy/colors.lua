return {
  {
    'datsfilipe/vesper.nvim',
    config = function()
      require'vesper'.setup{
        transparent = true,
        italics = {
          comments = true,
          keywords = true,
          functions = true,
          strings = true,
          variables = true,
        },
      }
      vim.cmd[[colorscheme vesper]]
    end
  }
}

