local autocmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup("Autocmds", { clear = true })

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
	pattern = { '*.json' },
	callback = function()
		-- Use jq as the formatter.
		if vim.fn.executable('jq') then
			vim.opt_local.formatprg = 'jq --tab'
		end
	end
})

-- vim: sw=4 ts=4
