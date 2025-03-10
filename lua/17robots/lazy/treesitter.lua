return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require 'nvim-treesitter.configs'.setup {
      ensure_installed = { 'vimdoc', 'javascript', 'typescript', 'c', 'lua', 'rust', 'jsdoc', 'bash' },
      sync_install = false,
      auto_install = true,
      indent = { enable = true },
      highlight = { enable = true, additional_vim_regex_hightlighting = 'markdown' }
    }
    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.dyn = {
      install_info = {
        url = "https://github.com/17robots/tree-sitter-dyn",
        files = {"src/parser.c"},
        branch = 'neovim',
      },
      filetype = 'dyn',
    }
    vim.filetype.add {
      extension = {
        dyn = 'dyn'
      }
    }
  end
}
