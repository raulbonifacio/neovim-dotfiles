local autocmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup("Autocmds", { clear = true })

-- autocmd({ 'InsertCharPre' }, {
-- 	group = group,
-- 	pattern = { '*' },
-- 	callback = function()
-- 		if vim.fn.pumvisible() == 1 or vim.fn.state("m") == "m" then
-- 			return
-- 		end
--
-- 		if vim.fn.match(vim.v.char, "[a-zA-Z_$]") == -1 then
-- 			return
-- 		end
--
-- 		local key = vim.keycode("<C-x><C-]>")
--
-- 		vim.api.nvim_feedkeys(key, "m", false)
-- 	end
-- })

autocmd({ 'BufWritePre' }, {
	group = group,
	pattern = { '*' },
	callback = function()
		-- Remove trailing spaces
		if not vim.opt_local.readonly:get() then
			vim.cmd([[%s/\s\+$//ge]])
		end
	end
})

autocmd({ 'BufEnter', 'BufWinEnter' }, {
	group = group,
	pattern = { '*.py' },
	callback = function()
		-- Use autopep8 as the formatter.
		if vim.fn.executable('autopep8') then
			vim.opt_local.formatprg = 'autopep8 -'
		end
	end
})

autocmd({ 'BufEnter', 'BufWinEnter' }, {
	group = group,
	pattern = { '*.json' },
	callback = function()
		-- Use jq as the formatter.
		if vim.fn.executable('jq') then
			vim.opt_local.formatprg = 'jq --tab'
		end
	end
})

autocmd({ 'BufEnter', 'BufWinEnter' }, {
	group = group,
	pattern = { '*.cpp', '*.hpp' },
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4

		-- Use clang-format as formatter.
		if vim.fn.executable('clang-format') == 0 then
			vim.opt_local.formatprg = 'clang-format -style=file'
		end

		-- Use <leader>a to switch between .cpp and .hpp
		vim.keymap.set('n', '<leader>a', function()
			local base = vim.fn.expand('%:r')
			local extension = vim.fn.expand('%:e')
			local hppfile = base .. '.hpp'
			local cppfile = base .. '.cpp'

			if extension == 'cpp' then
				vim.cmd.edit(hppfile)
			elseif vim.fn.filereadable(cppfile) == 1 then
				vim.cmd.edit(cppfile)
			end
		end, { buffer = true })
	end
})

autocmd({ 'BufEnter', 'BufWinEnter' }, {
	group = group,
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
			local base = vim.fn.expand('%:r')
			local extension = vim.fn.expand('%:e')
			local hfile = base .. '.h'
			local cfile = base .. '.c'

			if extension == 'c' then
				vim.cmd.edit(hfile)
			elseif vim.fn.filereadable(cfile) == 1 then
				vim.cmd.edit(cfile)
			end
		end, { buffer = true })
	end
})

autocmd({ 'BufEnter', 'BufWinEnter' }, {
	group = group,
	pattern = { '*.lua' },
	callback = function()
		vim.opt_local.errorformat = 'lua: %f:%l: %m'
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.include = "require\\s*(\\?\\s*[\"\']\\zs.*\\ze[\"\']\\s*)\\?"

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
