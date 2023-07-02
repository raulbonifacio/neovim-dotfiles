
local function configure_nvim_treesitter()
	local treesitter = require('nvim-treesitter.configs')

	treesitter.setup {
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		}
	}
end

return configure_nvim_treesitter

-- vim: sw=4 ts=4
