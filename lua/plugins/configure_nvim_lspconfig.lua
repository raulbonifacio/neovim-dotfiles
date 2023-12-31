local function configure_nvim_lspconfig()
	vim.diagnostic.config {
		update_in_insert = true
	}

	local lspconfig = require('lspconfig')
	local cmp_nvim_lsp = require('cmp_nvim_lsp')

	lspconfig.jedi_language_server.setup {
		capabilities = cmp_nvim_lsp.default_capabilities()
	}

	lspconfig.tsserver.setup {
		capabilities = cmp_nvim_lsp.default_capabilities()
	}

	lspconfig.clangd.setup {
		capabilities = cmp_nvim_lsp.default_capabilities(),
		filetypes = { "c" }
	}

	lspconfig.lua_ls.setup {
		capabilities = cmp_nvim_lsp.default_capabilities(),
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
			local options = { buffer = ev.buf }

			vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
			vim.keymap.set('n', '[s', vim.diagnostic.goto_prev, options)
			vim.keymap.set('n', ']s', vim.diagnostic.goto_next, options)
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, options)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, options)
			vim.keymap.set('n', '<c-k>', vim.lsp.buf.hover, options)
			vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, options)
			vim.keymap.set('n', '<leader>f', function()
				vim.lsp.buf.format { async = true }
			end, opts)
		end,
	})
end

return configure_nvim_lspconfig

-- vim: sw=4 ts=4
