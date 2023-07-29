vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes:2'
vim.opt.undodir = vim.env.HOME .. '/.config/nvim/undodir'
vim.opt.undofile = true
vim.opt.updatetime = 200
vim.opt.path:append {'**'}
vim.opt.completeopt:remove {'preview'}
vim.opt.completeopt:append {'menuone', 'noselect'}
vim.opt.wildmode = 'full'
vim.opt.cmdheight = 0
vim.opt.scrolloff = 999

-- vim: sw=4 ts=4
