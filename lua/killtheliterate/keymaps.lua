-- prev/next tab
vim.keymap.set('n', 'H', 'gT', { desc = 'Tab Left' })
vim.keymap.set('n', 'L', 'gt', { desc = 'Tab Right' })

-- line bubbling
vim.keymap.set('n', '<C-j>', ':m .+1<CR>==', { noremap = true, desc = 'Bubble Down' })
vim.keymap.set('n', '<C-k>', ':m .-2<CR>==', { noremap = true, desc = 'Bubble Up' }) -- conflicts with "signature help" from LSP
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv", { noremap = true, desc = 'Bubble Down' })
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv", { noremap = true, desc = 'Bubble Up' })

-- clear search
vim.keymap.set('n', '<leader>c', ':nohlsearch<CR>', { noremap = true, silent = true, desc = 'Clear search highlight' })

-- exit terminal mode
vim.keymap.set('t', '<C-o>', '<C-\\><C-n>', { noremap = true, silent = true, desc = 'Exit terminal mode' })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true, desc = 'Exit terminal mode' })

-- vim: ts=2 sts=2 sw=2 et
