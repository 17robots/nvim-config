return {
  {
    'Shatur/neovim-ayu',
    config = function()
      require'ayu'.setup{
        mirage = true,
        terminal = true,
        overrides = {},
      }
      vim.cmd.colorscheme('ayu')
    end
  }
}
