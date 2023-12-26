local function configure_nvim_snippy()

	local snippy = require('snippy');

	snippy.setup({
		mappings = {
			is = {
				['<Tab>'] = 'expand_or_advance',
				['<S-Tab>'] = 'previous',
			},
			nx = {
				['<leader>x'] = 'cut_text',
			},
		},
	})
end

return configure_nvim_snippy
