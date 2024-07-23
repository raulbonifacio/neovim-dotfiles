local function configure_nvim_lspconfig()
	vim.diagnostic.config {
		update_in_insert = true
	}

	local lspconfig = require('lspconfig')

	lspconfig.clangd.setup {}

	lspconfig.lua_ls.setup {
		settings = {
			Lua = {
				runtime = {
					version = 'Lua 5.4',
				},
				diagnostics = {
					globals = { 'vim', 'love' },
					disable = {
						'redefined-local',
						'lowercase-global'
					}
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false
				},
				telemetry = {
					enable = false
				},
			},
		},
	}

	vim.api.nvim_create_autocmd('LspAttach', {
		group = vim.api.nvim_create_augroup('UserLspConfig', {}),
		callback = function(ev)
			local buf = ev.buf
			local options = { buffer = buf }

			vim.bo[buf].omnifunc = "v:lua.vim.lsp.omnifunc"
			vim.bo[buf].tagfunc = nil

			vim.keymap.set('n', '[e', vim.diagnostic.goto_prev, options)
			vim.keymap.set('n', ']e', vim.diagnostic.goto_next, options)
			vim.keymap.set('n', 'gD', vim.lsp.buf.definition, options)
			vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, options)
			vim.keymap.set('n', '<c-k>', vim.lsp.buf.hover, options)
			vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, options)
			vim.keymap.set('n', '<leader>f', function()
				vim.lsp.buf.format { async = true }
			end, options)

			vim.keymap.set({ 'n', 'v' }, '<leader><space>', vim.lsp.buf.code_action, options)
		end,
	})
end

return configure_nvim_lspconfig

-- vim: sw=4 ts=4
