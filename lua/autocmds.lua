
local autocmd = vim.api.nvim_create_autocmd

autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = {"*.py"},
	callback = function()
		if vim.fn.executable('autopep8') == 0 then return end
		vim.opt_local.formatprg = "autopep8 -"
	end
})

-- vim: sw=4 ts=4
