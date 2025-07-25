return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  branch = 'main',
  config = function()
    local ensure_installed = { 'vimdoc', 'dyn', 'javascript', 'typescript', 'c', 'go', 'lua', 'rust', 'jsdoc', 'bash', 'zig', 'pug', 'css' },
    vim.api.nvim_create_autocmd('User', {
      pattern = 'TSUpdate',
      callback = function()
        require'nvim-treesitter.parsers'.dyn = {
          install_info = {
            url = 'https://github.com/17robots/tree-sitter-dyn',
            branch = 'neovim',
            queries = 'queries',
          }
        }
      end,
    })
    vim.filetype.add{ extension = { dyn = 'dyn' } }
    require'nvim-treesitter'.install(ensure_installed)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'vimdoc', 'dyn', 'javascript', 'typescript', 'c', 'go', 'lua', 'rust', 'jsdoc', 'bash', 'zig', 'pug', 'css' },
      callback = function() vim.treesitter.start() end,
    })
  end,
}
