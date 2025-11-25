vim.g.mapleader = ' '

-- Opens the file tree (Browse)
vim.keymap.set('n', '<leader>b', vim.cmd.Ex)

-- Swaps line up / down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Half-page jumping
vim.keymap.set('n', 'C-d', '<C-d>zz')
vim.keymap.set('n', 'C-u', '<C-u>zz')

-- Keeps search terms centered on screen
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Paste over selection
vim.keymap.set('x', '<leader>p', '"_dP')

-- Yanks to system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

-- Deletes to void register
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

-- Disable Q
vim.keymap.set('n', 'Q', '<nop')

-- Invoke LSP formatter
vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format() end)
