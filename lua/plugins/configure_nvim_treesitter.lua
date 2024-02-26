
local function configure_nvim_treesitter()
	local treesitter = require('nvim-treesitter.configs')
	treesitter.setup {
		sync_install = false,
		auto_install = false,
		ignore_install = {},
		ensure_installed = {},
		indent = {
			enable = false,
		},
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		modules = {}
	}
end

return configure_nvim_treesitter

-- vim: sw=4 ts=4
