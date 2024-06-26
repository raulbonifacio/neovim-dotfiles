local autocmd = vim.api.nvim_create_autocmd

autocmd({ 'BufWritePre' }, {
	pattern = { '*' },
	callback = function()
		-- Remove trailing spaces
		if not vim.opt_local.readonly:get() then
			vim.cmd([[%s/\s\+$//ge]])
		end

		-- Update the tags file.
		if vim.fn.executable('ctags') and vim.fn.filewritable('.ctags') == 1 then
			vim.fn.system(string.format('ctags -f .ctags --recurse --append "%s"', vim.fn.expand('<afile>')))
		end
	end
})

autocmd({ 'BufEnter', 'BufWinEnter' }, {
	pattern = { '*.py' },
	callback = function()
		-- Use autopep8 as the formatter.
		if vim.fn.executable('autopep8') then
			vim.opt_local.formatprg = 'autopep8 -'
		end
	end
})

autocmd({ 'BufEnter', 'BufWinEnter' }, {
	pattern = { '*.json' },
	callback = function()
		-- Use jq as the formatter.
		if vim.fn.executable('jq') then
			vim.opt_local.formatprg = 'jq --tab'
		end
	end
})

autocmd({ 'BufEnter', 'BufWinEnter' }, {
	pattern = { '*.c', '*.h' },
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4

		-- Use clang-format as formatter.
		if vim.fn.executable('clang-format') == 0 then
			vim.opt_local.formatprg = 'clang-format -style=file'
		end

		-- Use <leader>a to switch between .c and .h
		vim.keymap.set('n', '<leader>a', function()
			local extension;

			if vim.fn.expand('%:e') == 'c' then
				extension = '.h'
			else
				extension = '.c'
			end

			local filename = vim.fn.expand('%:r') .. extension

			vim.cmd.edit(filename)
		end, { buffer = true })
	end
})

autocmd({ 'BufEnter', 'BufWinEnter' }, {
	pattern = { '*.lua' },
	callback = function()
		vim.opt_local.errorformat = 'lua: %f:%l: %m'
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4

		-- Use <leader> a to switch between .lua and .test.lua.
		vim.keymap.set('n', '<leader>a', function()
			local extension;

			if vim.fn.expand('%:e:e') == 'test.lua' then
				extension = '.lua'
			else
				extension = '.test.lua'
			end

			local filename = vim.fn.expand('%:r:r') .. extension

			vim.cmd.edit(filename)
		end, { buffer = true })
	end
})

-- vim: sw=4 ts=4
