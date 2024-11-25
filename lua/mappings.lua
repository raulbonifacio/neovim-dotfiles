local set = vim.api.nvim_set_keymap
local del = vim.api.nvim_del_keymap

del('n', '[d')
del('n', ']d')
set('n', 'K', '<cmd> Man <cr>', { silent = true })
set('n', '<leader>l', '<cmd> luafile %<cr>', { silent = true })
set('n', '<leader>cc', '<cmd>! ctags --recurse -f .ctags * <cr>', { silent = true })
set('n', '[t', '<cmd> pop <cr>', { silent = true })
set('n', ']t', '<cmd> tag <cr>', { silent = true })
set('n', '[l', '<cmd> lwindow | lprev <cr>', { silent = true })
set('n', ']l', '<cmd> lwindow | lnext <cr>', { silent = true })
set('n', '[q', '<cmd> cwindow | cprev <cr>', { silent = true })
set('n', ']q', '<cmd> cwindow | cnext <cr>', { silent = true })
set('i', '<c-\\>}', '<c-o><c-w><c-}>', { silent = true })

-- vim: sw=4 ts=4
