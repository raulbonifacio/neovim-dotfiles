
local function configure_nvim_lspconfig()

	vim.diagnostic.config {
		update_in_insert = true
	}

	local lspconfig = require('lspconfig')

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
			vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
		end,
	})

end

return configure_nvim_lspconfig

-- vim: sw=4 ts=4
