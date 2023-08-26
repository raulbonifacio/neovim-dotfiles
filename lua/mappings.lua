local set = vim.keymap.set

set('n', '<leader>ce', '<cmd> edit $MYVIMRC <cr>')
set('n', '<leader>cr', '<cmd> luafile %<cr>')
set('n', '[q', '<cmd> CWindowPrev <cr>')
set('n', ']q', '<cmd> CWindowNext <cr>')

-- vim: sw=4 ts=4
