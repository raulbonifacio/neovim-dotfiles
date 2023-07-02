vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes:2'
vim.opt.undodir = 'undodir'
vim.opt.undofile = true
vim.opt.updatetime = 200
vim.opt.path:append {'**'}
vim.opt.completeopt:remove {'preview'}
vim.opt.completeopt:append {'menuone', 'noselect'}
