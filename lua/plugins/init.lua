local configure_base16_vim      = require('plugins.configure_base16_vim')
local configure_nvim_lspconfig  = require('plugins.configure_nvim_lspconfig')
local configure_nvim_treesitter = require('plugins.configure_nvim_treesitter')
local configure_nvim_cmp        = require('plugins.configure_nvim_cmp')
local configure_nvim_snippy		= require('plugins.configure_nvim_snippy')

local packer                    = require('packer')

packer.startup(function(use)
	use 'mattn/emmet-vim'
	use 'tpope/vim-sleuth'
	use 'airblade/vim-gitgutter'
	use { 'neovim/nvim-lspconfig', config = configure_nvim_lspconfig }
	use { 'tinted-theming/base16-vim', config = configure_base16_vim }
	use { 'nvim-treesitter/nvim-treesitter', config = configure_nvim_treesitter }
	use { 'hrsh7th/nvim-cmp', config = configure_nvim_cmp }
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use { 'dcampos/nvim-snippy', config = configure_nvim_snippy }
	use 'dcampos/cmp-snippy'
end)


-- vim: sw=4 ts=4
