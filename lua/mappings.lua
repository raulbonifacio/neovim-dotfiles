local set = vim.keymap.set

set('n', '<leader>l', '<cmd> luafile %<cr>', { silent = true })
set('n', '<leader>cc', '<cmd>! ctags --recurse -f .ctags * <cr>', { silent = true })
set('n', '[t', '<cmd> pop <cr>', { silent = true })
set('n', ']t', '<cmd> tag <cr>', { silent = true })
set('n', '[q', '<cmd> lwindow | lprev <cr>', { silent = true })
set('n', ']q', '<cmd> lwindow | lnext <cr>', { silent = true })

-- vim: sw=4 ts=4
