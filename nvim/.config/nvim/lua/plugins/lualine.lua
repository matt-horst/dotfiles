return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            component_separators = { left = '|', right = '|' },
            section_separators = { left = '', right = '' },
        }
    },
    config = function(_, opts)
        local colors = {
            lightgray = '#7b8496',
            gray      = '#3c4048',
            orange    = '#ffbd5e',
            purple    = '#bd5eff',
            red       = '#ff6e5e',
            yellow    = '#f1ff5e',
            green     = '#5eff6c',
            white     = '#ffffff',
            pink      = '#ff5ea0',
            magenta   = '#ff5ef1',
            cyan      = '#5ef1ff',
            blue      = '#5ea1ff',
            black     = '#16181a',
        }

        opts.options.theme = {
            normal = {
                a = { bg = colors.cyan, fg = colors.black, gui = 'bold' },
                b = { bg = colors.black, fg = colors.purple },
                c = { bg = colors.gray, fg = colors.white },
                x = { bg = colors.gray, fg = colors.white },
                y = { bg = colors.black, fg = colors.magenta },
                z = { bg = colors.blue, fg = colors.black, gui = 'bold' },
            },
            insert = {
                a = { bg = colors.green, fg = colors.black, gui = 'bold' },
                b = { bg = colors.black, fg = colors.purple },
                c = { bg = colors.gray, fg = colors.white },
                x = { bg = colors.gray, fg = colors.white },
                y = { bg = colors.black, fg = colors.magenta },
                z = { bg = colors.blue, fg = colors.black, gui = 'bold' },
            },
            visual = {
                a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
                b = { bg = colors.black, fg = colors.purple },
                c = { bg = colors.gray, fg = colors.white },
                x = { bg = colors.gray, fg = colors.white },
                y = { bg = colors.black, fg = colors.magenta },
                z = { bg = colors.blue, fg = colors.black, gui = 'bold' },
            },
            replace = {
                a = { bg = colors.red, fg = colors.black, gui = 'bold' },
                b = { bg = colors.black, fg = colors.purple },
                c = { bg = colors.gray, fg = colors.white },
                x = { bg = colors.gray, fg = colors.white },
                y = { bg = colors.black, fg = colors.magenta },
                z = { bg = colors.blue, fg = colors.black, gui = 'bold' },
            },
            command = {
                a = { bg = colors.orange, fg = colors.black, gui = 'bold' },
                b = { bg = colors.black, fg = colors.purple },
                c = { bg = colors.gray, fg = colors.white },
                x = { bg = colors.gray, fg = colors.white },
                y = { bg = colors.black, fg = colors.magenta },
                z = { bg = colors.blue, fg = colors.black, gui = 'bold' },
            },
            inactive = {
                a = { bg = colors.gray, fg = colors.white, gui = 'bold' },
                b = { bg = colors.black, fg = colors.purple },
                c = { bg = colors.gray, fg = colors.white },
                x = { bg = colors.gray, fg = colors.white },
                y = { bg = colors.black, fg = colors.magenta },
                z = { bg = colors.blue, fg = colors.black, gui = 'bold' },
            },
        }

        require("lualine").setup(opts)
    end,
}
