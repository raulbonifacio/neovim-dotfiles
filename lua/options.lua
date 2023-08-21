-- Disable Netrw
vim.g.loaded_netrw = true
vim.g.loaded_netrwPlugin = true

-- Basic configuration
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes:2'
vim.opt.undodir = vim.env.HOME .. '/.config/nvim/undodir'
vim.opt.undofile = true
vim.opt.updatetime = 200
vim.opt.path:append {'**'}
vim.opt.completeopt:remove {'preview'}
vim.opt.completeopt:append {'menuone', 'noselect'}
vim.opt.complete:append {'kiU'}
vim.opt.wildmode = 'full'
vim.opt.mouse = nil
vim.opt.wildoptions:append {"fuzzy"}

-- vim: sw=4 ts=4
