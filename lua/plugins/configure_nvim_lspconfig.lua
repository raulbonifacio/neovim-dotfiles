
local function configure_nvim_lspconfig()

	vim.diagnostic.config {
		update_in_insert = true
	}

	local lspconfig = require('lspconfig')

	lspconfig.jedi_language_server.setup {}

	lspconfig.tsserver.setup {}

	lspconfig.clangd.setup {}

	lspconfig.lua_ls.setup {
		settings = {
			Lua = {
				runtime = {
					version = 'LuaJIT',
				},
				diagnostics = {
					globals = {'vim', 'love'},
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
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
			local options = { buffer = ev.buf }

			vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
			vim.keymap.set('n', '[s', vim.diagnostic.goto_prev, options)
			vim.keymap.set('n', ']s', vim.diagnostic.goto_next, options)
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, options)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, options)
			vim.keymap.set('n', '<c-k>', vim.lsp.buf.hover, options)
			vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, options)
		end,
	})

end

return configure_nvim_lspconfig

-- vim: sw=4 ts=4
