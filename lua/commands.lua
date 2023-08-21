
local command = vim.api.nvim_create_user_command

command('CWindowNext', 'cwindow | cnext', {})
command('CWindowPrev', 'cwindow | cprev', {})

command('Grep', 'cexpr system("grep -RIn <args>")', { nargs = 1 })

command('Find', 'edit <args>', {
	nargs = 1,
	complete =  function (arglead)
		if vim.fn.executable('fzy') ~= 0 then
			return vim.fn.systemlist('find | fzy --show-matches=' .. arglead .. ' | head -n 10')
		end
	end
})

-- vim: sw=4 ts=4
