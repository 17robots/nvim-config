local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
    use'wbthomason/packer.nvim'
    use'theprimeagen/harpoon'
    use'theprimeagen/refactoring.nvim'
    use'mbbill/undotree'
    use'tpope/vim-fugitive'
    use'nvim-treesitter/nvim-treesitter-context'
    use'xiyaowong/transparent.nvim'

    use{'rose-pine/neovim', as = 'rose-pine', config = function() vim.cmd'colorscheme rose-pine' end}
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { { 'nvim-lua/plenary.nvim' } }}
    use { 'folke/trouble.nvim', config = function() require('trouble').setup { icons = false } end }
    use { 'nvim-treesitter/nvim-treesitter', run = function() local ts_update = require('nvim-treesitter.install').update({ with_sync = true }); ts_update(); end, }
    use { 'VonHeikemen/lsp-zero.nvim', branch = 'v1.x', requires = {
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'}, 
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
      {'saadparwaiz1/cmp_luasnip'},
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets/cmp_luasnip'}
    }}
end)
