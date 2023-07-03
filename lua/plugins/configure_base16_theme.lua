
local function configure_base16_theme()
	if vim.env.BASE16_THEME then
		--vim.opt.termguicolors = true
		--vim.g.base16_colorspace = 256
		vim.g.base16_background_transparent = 1
		vim.cmd.colorscheme('base16-' .. vim.env.BASE16_THEME)
	end
end

return configure_base16_theme

-- vim: sw=4 ts=4
