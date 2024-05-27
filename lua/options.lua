-- Disable Netrw
vim.g.loaded_netrw = true
vim.g.loaded_netrwPlugin = true

-- Handle headers as C files
vim.g.c_syntax_for_h = true

-- General configuration
vim.opt.statusline = '%F%q%m%=%5.5l,%-5.5c%y'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes:3'
vim.opt.undodir = vim.env.HOME .. '/.config/nvim/undodir'
vim.opt.undofile = true
vim.opt.path:append { '**' }
vim.opt.completeopt:remove { 'preview' }
vim.opt.completeopt:append { 'menu', 'menuone', 'noselect', 'longest' }
vim.opt.complete:append { 'i' }
vim.opt.wildoptions:append { 'fuzzy' }
vim.opt.wrap = false
vim.opt.tags:append({ '.ctags' })
vim.opt.foldenable = false
vim.opt.foldmethod = 'indent'

-- vim: sw=4 ts=4
