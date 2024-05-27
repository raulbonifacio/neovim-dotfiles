local set = vim.keymap.set

set('n', '<leader>l', '<cmd> luafile %<cr>', { silent = true })
set('n', '<leader>cc', '<cmd>! ctags --recurse -f .ctags * <cr>', { silent = true })
set('n', '[t', '<cmd> pop <cr>', { silent = true })
set('n', ']t', '<cmd> tag <cr>', { silent = true })
set('n', '[l', '<cmd> lwindow | lprev <cr>', { silent = true })
set('n', ']l', '<cmd> lwindow | lnext <cr>', { silent = true })
set('n', '[q', '<cmd> cwindow | cprev <cr>', { silent = true })
set('n', ']q', '<cmd> cwindow | cnext <cr>', { silent = true })

-- vim: sw=4 ts=4
