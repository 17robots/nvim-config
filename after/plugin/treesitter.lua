require'nvim-treesitter.configs'.setup{
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript' },
  auto_install = false,
  highlight = { enable = true, additional_vim_regex_highlighting = true },
  indent = { enable = true, },
}
