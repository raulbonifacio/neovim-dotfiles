local function configure_nvim_cmp()
	local cmp = require 'cmp'

	cmp.setup({
		snippet = {
			expand = function(args)
				vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
			end,
		},
		window = {

		},
		mapping = cmp.mapping.preset.insert({
			['<C-n>'] = function()
				if vim.snippet.active({ direction = 1 }) then
					vim.snippet.jump(1)
				elseif cmp.visible() then
					cmp.select_next_item()
				else
					cmp.complete()
				end
			end,
			['<C-p>'] = function()
				if vim.snippet.active({ direction = 1 }) then
					vim.snippet.jump(-1)
				elseif cmp.visible() then
					cmp.select_prev_item()
				else
					cmp.complete()
				end
			end,
			['<C-e>'] = cmp.mapping.abort(),
			['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
		}, {
			{ name = 'buffer' },
		}, {
			{ name = 'path' },
		})
	})
end

return configure_nvim_cmp;

-- vim: sw=4 ts=4
