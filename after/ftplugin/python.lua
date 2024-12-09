if vim.fn.exists("b:python_ft_plugin_loaded") == 1 then
	return
end

vim.b.python_ft_plugin_loaded = true

-- Use autopep8 as the formatter.
if vim.fn.executable('autopep8') == 1 then
	vim.opt_local.formatprg = 'autopep8 -'
end
