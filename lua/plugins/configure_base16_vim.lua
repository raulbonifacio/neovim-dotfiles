
local function configure_base16_vim()
	vim.api.nvim_create_autocmd({ "Colorscheme" }, {
		group = vim.api.nvim_create_augroup('base16-vim', { clear = true }),
		callback = function()
			vim.cmd.highlight { "link Statusline Normal", bang = true }
			vim.cmd.highlight { "link StatusLineNC Signcolumn", bang = true }
			vim.cmd.highlight { "link WinSeparator Signcolumn", bang = true }
			vim.cmd.highlight { "link TabLineSel Normal", bang = true }
			vim.cmd.highlight { "link TabLineFill Signcolumn", bang = true }
			vim.cmd.highlight { "link TabLine Signcolumn", bang = true }
			vim.cmd.highlight { "link TabLine Signcolumn", bang = true }
			vim.cmd.highlight { "link PmenuSel Normal", bang = true }
			vim.cmd.highlight { "link Pmenu Signcolumn", bang = true }
			vim.cmd.highlight { "link CmpItemAbbr Signcolumn", bang = true }
		end
	})

	if vim.env.BASE16_THEME then
		vim.opt.termguicolors = true
		vim.g.base16_colorspace = 256
		vim.g.base16_background_transparent = 1
		vim.cmd.colorscheme('base16-' .. vim.env.BASE16_THEME)
	end
end

return configure_base16_vim

-- vim: sw=4 ts=4
