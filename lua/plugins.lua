local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use { 'neovim/nvim-lspconfig', requires = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim'}, }
    use { 'hrsh7th/nvim-cmp', requires = {'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip'} }
    use { 'nvim-treesitter/nvim-treesitter', run = function() pcall(require'nvim-treesitter.install'.update { with_sync = true }) end, }
    use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter', }
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
    use 'navarasu/onedark.nvim'
end)

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | PackerCompile',
    group = packer_group,
    pattern = vim.fn.expand '$MYVIMRC',
})
