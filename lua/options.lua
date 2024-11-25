-- Disable Netrw
vim.g.loaded_netrw = true
vim.g.loaded_netrwPlugin = true

-- Handle headers as C files
vim.g.c_syntax_for_h = true

vim.opt.termguicolors = false

-- General configuration
vim.opt.complete:append { 'i', 't', 'b', 'u' }
vim.opt.completeopt = { 'menu', 'menuone', 'longest' }
vim.opt.foldenable = false
vim.opt.foldmethod = 'indent'
vim.opt.mouse = ''
vim.opt.number = true
vim.opt.path:append { '**' }
vim.opt.previewheight = 10
vim.opt.pumheight = 10;
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes:3'
vim.opt.splitbelow = true
vim.opt.statusline = '%F%q%m%=%5.5l,%-5.5c%y'
vim.opt.tags:append({ '.ctags', vim.env.HOME .. '/.config/nvim/.ctags' })
vim.opt.undodir = vim.env.HOME .. '/.config/nvim/undodir'
vim.opt.undofile = true
vim.opt.updatetime = 200
vim.opt.fillchars:append "vert: "
vim.opt.wildoptions:append { 'fuzzy' }
vim.opt.wrap = false
vim.opt.scrolloff = 10

-- vim: sw=4 ts=4
