
local autocmd = vim.api.nvim_create_autocmd

autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = {"*.py"},
	callback = function()
		if vim.fn.executable('autopep8') == 0 then return end
		vim.opt_local.formatprg = "autopep8 -"
	end
})

autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = {"*.c", "*.h"},
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth= 4
		vim.keymap.set("n", "<leader>a", function()
			local extension;

			if vim.fn.expand("%:e") == "c" then
				extension = ".h"
			else
				extension = ".c"
			end

			local filename = vim.fn.expand("%:r") ..extension

			vim.cmd.edit(filename)
		end, { buffer = true })
	end
})

autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = {"*.lua"},
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth= 4
	end
})

-- vim: sw=4 ts=4
