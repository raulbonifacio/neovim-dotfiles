-- Disable Netrw
vim.g.loaded_netrw = true
vim.g.loaded_netrwPlugin = true
vim.g.c_syntax_for_h = true

-- Basic configuration
vim.opt.statusline = '%F%q%m%=%5.5l,%-5.5c%y'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes:2'
vim.opt.undodir = vim.env.HOME .. '/.config/nvim/undodir'
vim.opt.undofile = true
vim.opt.updatetime = 200
vim.opt.path:append { vim.env.HOME .. '/.config/nvim/**', '**' }
vim.opt.completeopt:remove { 'preview' }
vim.opt.completeopt:append { 'menu', 'menuone', 'noselect', 'longest' }
vim.opt.complete:append { 'kiU' }
vim.opt.wildmode = 'full'
vim.opt.mouse = nil
vim.opt.wildoptions:append { 'fuzzy' }
vim.opt.wrap = false
vim.opt.cmdheight = 1
vim.opt.tags:append({ '.ctags' })
vim.opt.foldenable = false
vim.opt.foldmethod = 'indent'
vim.opt.cindent = false

-- vim: sw=4 ts=4
