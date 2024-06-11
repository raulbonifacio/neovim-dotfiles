local command = vim.api.nvim_create_user_command

command('Grep', 'lexpr system("grep --exclude \'.*\' -RIn <args>")', { nargs = 1 })

command('Find', 'edit <args>', {
	nargs = 1,
	complete = function(arglead)
		return vim.fn.matchfuzzy(vim.fn.systemlist('find * -type f'), arglead, { limit = 30 });
	end
})

command('Badd', function(arguments)
	for _, glob in pairs(arguments.fargs) do
		for _, filename in pairs(vim.fn.globpath('**', glob, true, true)) do
			vim.cmd.badd(filename)
		end
	end
end, { nargs = '+' })

-- vim: sw=4 ts=4
