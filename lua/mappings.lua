local set = vim.keymap.set

set('n', '<leader>ce', '<cmd> edit $MYVIMRC <cr>', { silent = true })
set('n', '<leader>cr', '<cmd> luafile %<cr>', { silent = true })
set('n', '<leader>cc', '<cmd>! ctags --recurse -f .ctags <cr>', { silent = true })
set('n', '[t', '<cmd> pop <cr>', { silent = true })
set('n', ']t', '<cmd> tag <cr>', { silent = true })
set('n', '[q', '<cmd> CWindowPrev <cr>', { silent = true })
set('n', ']q', '<cmd> CWindowNext <cr>', { silent = true })

-- vim: sw=4 ts=4
