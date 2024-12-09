-- Include guard.
if vim.fn.exists("b:c_ft_plugin") == 1 then
	return
end

vim.b.c_ft_plugin = true

-- Configuration.
local set = vim.opt_local

set.tabstop = 4
set.shiftwidth = 4

set.formatprg = 'clang-format -style=file'

-- Use clang-format as formatter.
if vim.fn.executable('clang-format') == 1 then
	set.formatprg = 'clang-format -style=file'
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
