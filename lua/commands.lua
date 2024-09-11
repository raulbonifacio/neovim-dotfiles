local command = vim.api.nvim_create_user_command

command('Grep', 'cexpr system("grep --exclude \'.*\' -RIn <args>")', { nargs = 1 })

command('Find', 'edit <args>', {
	nargs = 1,
	complete = function(arglead)
		return vim.fn.matchfuzzy(vim.fn.systemlist('find * -type f'), arglead, { limit = 30 });
	end
})

command('Badd', function(arguments)
	for _, glob in pairs(arguments.fargs) do
		for _, filename in pairs(vim.fn.globpath('**', glob, true, true)) do
			vim.api.nvim_cmd({ cmd = "badd", args = { filename } }, {})
		end
	end
end, { nargs = '+' })

command('CTagsCreate', function()
	if vim.fn.executable('ctags') == 0 then
		return
	end

	vim.system({ 'ctags', '-f', '.ctags', '--quiet', '--recurse', '*' })
end, {})

command('CTagsUpdate', function()
	if vim.fn.executable('ctags') == 0 or vim.fn.filewritable('.ctags') == 0 then
		return
	end

	vim.system({ 'ctags', '-f', '.ctags', '--quiet', '--recurse', vim.fn.expand('<afile>') })
end, {})

-- vim: sw=4 ts=4
