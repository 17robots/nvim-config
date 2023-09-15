local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print(lazypath)
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require'lazy'.setup({
 'theprimeagen/harpoon',
 'xiyaowong/transparent.nvim',
 'mbbill/undotree',
 { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
 {
   'neovim/nvim-lspconfig',
   dependencies = { 
    {'williamboman/mason.nvim', config = true,},
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'rafamadriz/friendly-snippets'
   }
 },
 {'Soares/base16.nvim', config = function() vim.cmd'set background=dark' vim.cmd'colorscheme pop' end},
 {'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = {
    'nvim-lua/plenary.nvim',
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = function() return vim.fn.executable'make' == 1 end}
 }}
})

