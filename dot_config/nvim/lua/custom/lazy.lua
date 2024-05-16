local lazy = require("lazy")
local plugins = {
    'nvim-telescope/telescope.nvim', tag = '0.1.6', dependencies = { 'nvim-lua/plenary.nvim' },
    'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
    'mbbill/undotree',

    -- LSP Support
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Autocompletion
    'hrsh7th/nvim-cmp',        -- Required
    'hrsh7th/cmp-nvim-lsp',    -- Required
    'L3MON4D3/LuaSnip',        -- Required
    'folke/neodev.nvim',

    -- Color Scheme
    'catppuccin/nvim', name = 'catppuccin', priority = 1000,

    -- Git
    'tpope/vim-fugitive',
}

lazy.setup(plugins)
