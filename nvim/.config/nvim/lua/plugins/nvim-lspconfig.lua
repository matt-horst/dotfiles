return {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },

    opts = {
        servers = {
            lua_ls = {
                diagnostics = {
                    globals = { "vim" },
                },

                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
            },
            clangd = {
            },
            neocmake = {
                filetypes = { "cmake" },
                single_file_support = true,
            },
        }
    },

    config = function(_, opts)
        local lspconfig = require("lspconfig")
        for server, config in pairs(opts.servers) do
            config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
            vim.lsp.config(server, config)
            vim.lsp.enable(server)
        end

        vim.filetype.add({
            extension = {
                cmakein = "cmake",
            },
            filename = {
                ["CMakeLists.txt"] = "cmake",
            },
        })
    end,
}
