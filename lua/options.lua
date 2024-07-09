-- Disable Netrw
vim.g.loaded_netrw = true
vim.g.loaded_netrwPlugin = true

-- Handle headers as C files
vim.g.c_syntax_for_h = true

-- General configuration
vim.opt.complete:append { 'i', 'd', 't' }
vim.opt.completeopt:append { 'menu', 'menuone', 'noselect', 'noinsert' }
vim.opt.completeopt:remove { 'preview' }
vim.opt.foldenable = false
vim.opt.foldmethod = 'indent'
vim.opt.number = true
vim.opt.path:append { '**' }
vim.opt.previewheight = 4
vim.opt.relativenumber = true
vim.opt.scrolloff = 999
vim.opt.signcolumn = 'yes:3'
vim.opt.splitbelow = true
vim.opt.statusline = '%F%q%m%=%5.5l,%-5.5c%y'
vim.opt.tags:append({ '.ctags' })
vim.opt.undodir = vim.env.HOME .. '/.config/nvim/undodir'
vim.opt.undofile = true
vim.opt.updatetime = 200
vim.opt.wildoptions:append { 'fuzzy' }
vim.opt.wrap = false

-- vim: sw=4 ts=4
