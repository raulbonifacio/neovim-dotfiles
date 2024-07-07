local set = vim.keymap.set
local del = vim.keymap.del

del('n', '[d')
del('n', ']d')
set('n', '<leader>l', '<cmd> luafile %<cr>', { silent = true })
set('n', '<leader>cc', '<cmd>! ctags --recurse -f .ctags * <cr>', { silent = true })
set('n', '[t', '<cmd> pop <cr>', { silent = true })
set('n', ']t', '<cmd> tag <cr>', { silent = true })
set('n', '[l', '<cmd> lwindow | lprev <cr>', { silent = true })
set('n', ']l', '<cmd> lwindow | lnext <cr>', { silent = true })
set('n', '[q', '<cmd> cwindow | cprev <cr>', { silent = true })
set('n', ']q', '<cmd> cwindow | cnext <cr>', { silent = true })
set('i', '<c-\\>}', '<c-o><c-w><c-}>')

-- vim: sw=4 ts=4
