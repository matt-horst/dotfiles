vim.opt.guicursor = ''

-- Alway show relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Use 4 spaces as indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Do not wrap lines
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

-- Only highlight current patched pattern
vim.opt.hlsearch = false
-- Show matches when typing search pattern
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- 8 Minimum lines to keep above / below cursor
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

vim.opt.updatetime = 50

vim.g.clipboard = {
    name = 'wl-clipboard',
    copy = {
        ['+'] = "wl-copy --type text/plain",
        ['*'] = "wl-copy --primary --type text/plain",
    },
    paste = {
        ['+'] = "wl-paste --no-newline",
        ['*'] = "wl-paste --primary --no-newline",
    },
}
