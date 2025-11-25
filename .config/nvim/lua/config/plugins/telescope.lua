local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tt', builtin.find_files, {})
vim.keymap.set('n', '<leader>tp', builtin.git_files, {})
vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
