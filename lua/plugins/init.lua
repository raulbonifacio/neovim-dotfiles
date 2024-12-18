local packer                    = require('packer')
local configure_base16_vim      = require('plugins.configure_base16_vim')
local configure_nvim_lspconfig  = require('plugins.configure_nvim_lspconfig')
local configure_nvim_treesitter = require('plugins.configure_nvim_treesitter')

packer.startup(function(use)
	use 'tpope/vim-sleuth'
	use 'airblade/vim-gitgutter'
	use { 'neovim/nvim-lspconfig', config = configure_nvim_lspconfig }
	use { 'tinted-theming/base16-vim', config = configure_base16_vim }
	use { 'nvim-treesitter/nvim-treesitter', config = configure_nvim_treesitter }
end)

-- vim: sw=4 ts=4
