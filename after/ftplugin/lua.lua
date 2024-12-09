
if vim.fn.exists("b:lua_ft_plugin_loaded") == 1 then
	return
end

vim.b.lua_ft_plugin_loaded = true

local set = vim.opt_local

set.errorformat = 'lua: %f:%l: %m'
set.tabstop = 4
set.shiftwidth = 4
set.include = "require\\s*(\\?\\s*[\"\']\\zs.*\\ze[\"\']\\s*)\\?"

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
end)

-- vim: sw=4 ts=4
