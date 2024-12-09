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

command('CTags', function(arguments)

	if vim.fn.executable('ctags') == 0 then
		return
	end

	local command = { 'ctags', '-f', '.ctags', '--kinds-all=*', '--recurse' }

	local system_files = {
		'/usr/include/string.h',
		'/usr/include/stdlib.h',
		'/usr/include/stdint.h'
	}

	for _, file in pairs(system_files) do
		table.insert(command, vim.fn.resolve(file))
	end

	for _, arg in pairs(arguments.fargs) do
		table.insert(command, vim.fn.resolve(arg))
	end

	for _, part in pairs(command) do
		vim.notify(part)
	end

	vim.system(command)
end, { nargs = '*', complete='file' })

-- vim: sw=4 ts=4
