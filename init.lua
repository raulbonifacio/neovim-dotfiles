require('plugins.init')
require('options')
require('commands')
require('autocmds')
require('mappings')

vim.opt.completefunc = 'v:lua.completeme'

-- vim: sw=4 ts=4
